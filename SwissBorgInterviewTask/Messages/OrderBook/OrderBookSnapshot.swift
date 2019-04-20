//
//  OrderBookSnapshot.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

final class OrderBookSnapshot: Decodable {
    let channelId: Int
    let orderBooks: [OrderBook]
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        channelId = try container.decode(Int.self)
        orderBooks = try container.decode([OrderBook].self)
    }
}
