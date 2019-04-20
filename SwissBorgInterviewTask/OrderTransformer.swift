//
//  OrderTransformer.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

class OrderTransformer {
    static func viewModelsFrom(_ orderBooks: [OrderBook]) -> [BookinCellViewModel] {
        let sellOrders = orderBooks.filter { $0.amount < 0}
        let buyOrders = orderBooks.filter { $0.amount >= 0}
        
        var models = [BookinCellViewModel]()
        for i in 0..<min(sellOrders.count, buyOrders.count) {
            models.append(BookinCellViewModel(buyOrder: buyOrders[i], sellOrder: sellOrders[i]))
        }
        return models
    }
}
