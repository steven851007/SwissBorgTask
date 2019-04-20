//
//  OrderBookUpdate.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

final class OrderBookUpdate: Decodable {
    let channelId: Int
    let price: Float
    let count: Float
    let amount: Float
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        channelId = try container.decode(Int.self)
        price = try container.decode(Float.self)
        count = try container.decode(Float.self)
        amount = try container.decode(Float.self)
    }
}
