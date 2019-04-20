//
//  TickerEventRequest.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

final class TickerEventRequest: Codable {
    let event: String
    let channel: String
    let pair: String
    
    init(event: String, channel: String, pair: String) {
        self.event = event
        self.channel = channel
        self.pair = pair
    }
}
