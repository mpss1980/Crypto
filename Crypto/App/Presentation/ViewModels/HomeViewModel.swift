//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let getCoinListUseCase: GetCoinListUseCaseType
    @Published var coins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    init(getCoinListUseCase: GetCoinListUseCaseType) {
        self.getCoinListUseCase = getCoinListUseCase
    }
    
    func onAppear() {
        Task {
            let result = await getCoinListUseCase.execute()
            
            guard case .success(let coins) = result else { return }
            
            Task { @MainActor in
                self.coins = coins
            }
        }
    }
}
