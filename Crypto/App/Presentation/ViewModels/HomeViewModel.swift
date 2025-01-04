//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.coins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
