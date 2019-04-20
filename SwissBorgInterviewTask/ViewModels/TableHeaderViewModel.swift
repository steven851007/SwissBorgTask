//
//  TableHeaderViewModel.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation

class TableHeaderViewModel {
    
    let tickerEventResponse: TickerEventResponse
    
    init(tickerEventResponse: TickerEventResponse) {
        self.tickerEventResponse = tickerEventResponse
    }
    
    var volumeText: String {
        return "VOL: \(self.tickerEventResponse.volume)"
    }
    
    var lastText: String {
        return "LAST: $\(self.tickerEventResponse.lastPrice)"
    }
    
    var percentageText: String {
        return "\(self.tickerEventResponse.dailyChangePerc)%"
    }
    
    var dailyLowText: String {
        return "LOW: $\(self.tickerEventResponse.low)"
    }
    
    var dailyHighText: String {
        return "HIGH: $\(self.tickerEventResponse.high)"
    }
}
