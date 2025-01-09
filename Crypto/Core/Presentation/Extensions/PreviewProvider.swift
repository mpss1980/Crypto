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
    
    let statistics = [
        Statistics(id: "123", title: "Title", value: "1.23", percentageChange: -70.0),
        Statistics(id: "124", title: "Title2", value: "1.432", percentageChange: 30.0),
        Statistics(id: "125", title: "Title3", value: "1.3433", percentageChange: -43.0),
        Statistics(id: "126", title: "Title4", value: "1.23", percentageChange: 0),
    ]
}
