//
//  OrderBook.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

final class OrderBook: Decodable {
    let price: Float
    let count: Float
    let amount: Float
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        price = try container.decode(Float.self)
        count = try container.decode(Float.self)
        amount = try container.decode(Float.self)
    }
}
