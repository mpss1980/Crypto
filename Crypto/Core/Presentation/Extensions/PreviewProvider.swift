//
//  PreviewProvider.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview { DeveloperPreview.instance }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
   
    let coin = Coin(
        id: "bitcoin",
        name: "Bitcoin",
        symbol: "btc",
        currentPrice: 61400.0,
        rank: 1,
        priceChangePercentage24H: 6.879440,
        currentHoldings: 1.5
    )
}
