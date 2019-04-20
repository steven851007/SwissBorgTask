//
//  TickerEventResponse.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

final class TickerEventResponse: Decodable {
    
    let channelID: Int
    let bid: Float
    let bidSize: Float
    let ask: Float
    let askSize: Float
    let dailyChange: Float
    let dailyChangePerc: Float
    let lastPrice: Float
    let volume: Float
    let high: Float
    let low: Float
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        self.channelID = try container.decode(Int.self)
        self.bid = try container.decode(Float.self)
        self.bidSize = try container.decode(Float.self)
        self.ask = try container.decode(Float.self)
        self.askSize = try container.decode(Float.self)
        self.dailyChange = try container.decode(Float.self)
        self.dailyChangePerc = try container.decode(Float.self)
        self.lastPrice = try container.decode(Float.self)
        self.volume = try container.decode(Float.self)
        self.high = try container.decode(Float.self)
        self.low = try container.decode(Float.self)
    }
    
}
