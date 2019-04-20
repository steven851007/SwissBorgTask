//
//  BitfinexWSManager.swift
//  SwissBorgInterviewTask
//
//  Created by Istvan Balogh on 2019. 04. 20..
//  Copyright © 2019. Balogh István. All rights reserved.
//

import Foundation
import Starscream

protocol BitfinexWSManagerDelegate: Any {
    
    func dataSourceDidConnect(_ dataSource: BitfinexWSManager)
    func dataSource(_ dataSource: BitfinexWSManager, didReceive tickerEventResponse: TickerEventResponse)
    func dataSource(_ dataSource: BitfinexWSManager, didReceive orderBookSnapshot: OrderBookSnapshot)
    func dataSource(_ dataSource: BitfinexWSManager, didReceive orderBookUpdate: OrderBookUpdate)
}

class BitfinexWSManager: WebSocketDelegate {
    
    var delegate: BitfinexWSManagerDelegate?
    var bookChannelId: String?
    
    func websocketDidConnect(socket: WebSocketClient) {
        self.delegate?.dataSourceDidConnect(self)
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        guard let jsonData = text.data(using: .utf8) else { return }
        
        if let tickerResponse = try? JSONDecoder().decode(TickerEventResponse.self, from: jsonData) {
            self.delegate?.dataSource(self, didReceive: tickerResponse)
            return
        } else if let orderBookSubscribed = try? JSONDecoder().decode(OrderBookSubscribedEventResponse.self, from: jsonData) {
            self.bookChannelId = String(orderBookSubscribed.chanId)
            return
        } else if let response = try? JSONDecoder().decode(OrderBookSnapshot.self, from: jsonData) {
            self.delegate?.dataSource(self, didReceive: response)
            return
        } else if let response = try? JSONDecoder().decode(OrderBookUpdate.self, from: jsonData) {
            self.delegate?.dataSource(self, didReceive: response)
            return
        }
        
        print("Unhandled message received: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocketDidReceiveData")
    }
    
    let socket: WebSocket
    
    init() {
        self.socket = WebSocket(url: URL(string: "wss://api.bitfinex.com/ws/")!)
        self.socket.delegate = self
        
    }
    
    func connect() {
        self.socket.connect()
    }
    
    func subscribeToTickerEvents() {
        let tickerEvent = TickerEventRequest(event: "subscribe", channel: "ticker", pair: "BTCUSD")
        let jsonData = try! JSONEncoder().encode(tickerEvent)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        self.socket.write(string: jsonString)
    }
    
    func subscribeToOrderBookEvents() {
        let orderBookEvent = OrderBooksEventRequest(event: "subscribe", channel: "book", pair: "BTCUSD", prec: "P0", freq: "F1")
        let jsonData = try! JSONEncoder().encode(orderBookEvent)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        self.socket.write(string: jsonString)
    }
    
}
