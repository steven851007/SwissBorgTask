//
//  ViewController.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let networking = BitfinexWSManager()
    var tableHeaderView: TableHeaderView!
    var orderBooks = [BookinCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networking.delegate = self
        self.networking.connect()
        self.tableHeaderView = (Bundle.main.loadNibNamed("TableHeaderView", owner: self, options: nil)?[0] as? TableHeaderView)
        self.tableView.tableHeaderView = self.tableHeaderView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeHeaderToFit()
    }
    
    private func sizeHeaderToFit() {
        let headerView = tableView.tableHeaderView!
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = headerView.frame
        frame.size.height = height
        headerView.frame = frame
        
        tableView.tableHeaderView = headerView
    }
}

extension ViewController: BitfinexWSManagerDelegate {
    func dataSource(_ dataSource: BitfinexWSManager, didReceive orderBookUpdate: OrderBookUpdate) {
        // Here we can update the tableview with the new values
    }
    
    func dataSource(_ dataSource: BitfinexWSManager, didReceive orderBookSnapshot: OrderBookSnapshot) {
        self.orderBooks = OrderTransformer.viewModelsFrom(orderBookSnapshot.orderBooks)
        self.tableView.reloadData()
    }
    
    func dataSourceDidConnect(_ dataSource: BitfinexWSManager) {
        self.networking.subscribeToTickerEvents()
        self.networking.subscribeToOrderBookEvents()
    }
    
    func dataSource(_ dataSource: BitfinexWSManager, didReceive tickerEventResponse: TickerEventResponse) {
        let model = TableHeaderViewModel(tickerEventResponse: tickerEventResponse)
        self.tableHeaderView.update(with: model)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderBooks.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BookingCell = tableView.dequeueReusableCell(withIdentifier: "BookingCell", for: indexPath) as! BookingCell
        
        if indexPath.row == 0 {
            cell.buyPriceLabel.text = "PRICE"
            cell.sellPriceLabel.text = "PRICE"
            cell.buyAmountLabel.text = "AMOUNT"
            cell.sellAmountLabel.text = "AMOUNT"
            return cell
        }
        
        cell.update(with: self.orderBooks[indexPath.row - 1 ])
        return cell
    }
}


