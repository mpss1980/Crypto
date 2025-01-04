//
//  Coin.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//

import Foundation

struct Coin: Identifiable {
    let id: String
    let name: String
    let symbol: String
    let currentPrice: Double
    let rank: Int
    let priceChangePercentage24H: Double
    let currentHoldings: Double
    
    func updateHoldings(amount: Double) -> Coin {
        return Coin(id: id, name: name, symbol: symbol, currentPrice: currentPrice, rank: rank, priceChangePercentage24H: priceChangePercentage24H, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return currentHoldings * currentPrice
    }
}
