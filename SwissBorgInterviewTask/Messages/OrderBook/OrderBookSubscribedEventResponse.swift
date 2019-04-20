
//
//  File.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

final class OrderBookSubscribedEventResponse: Codable {
    let event: String
    let channel: String
    let pair: String
    let chanId: Int
    let prec: String
    let freq: String
    let len: String
}
