//
//  BookinCellViewModel.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

class BookinCellViewModel {
    
    let sellOrder: OrderBook
    let buyOrder: OrderBook
    
    init(buyOrder: OrderBook, sellOrder: OrderBook) {
        self.buyOrder = buyOrder
        self.sellOrder = sellOrder
    }
    
    var buyPriceText: String {
        return "\(self.buyOrder.price)"
    }
    
    var buyAmountText: String {
        return String(format: "%.5f", self.buyOrder.amount)
    }
    
    var sellPriceText: String {
        return "\(self.sellOrder.price)"
    }
    
    var sellAmountText: String {
        return String(format: "%.5f", self.sellOrder.amount * -1)
    }
    
}
