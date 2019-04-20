//
//  BookingCell.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation
import UIKit

class BookingCell: UITableViewCell {
    
    @IBOutlet weak var buyPriceLabel: UILabel!
    @IBOutlet weak var buyAmountLabel: UILabel!
    @IBOutlet weak var sellPriceLabel: UILabel!
    @IBOutlet weak var sellAmountLabel: UILabel!
    
    func update(with model: BookinCellViewModel) {
        self.buyPriceLabel.text = model.buyPriceText
        self.buyAmountLabel.text = model.buyAmountText
        self.sellPriceLabel.text = model.sellPriceText
        self.sellAmountLabel.text = model.sellAmountText
    }
}

