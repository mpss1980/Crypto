//
//  GetCoinsUseCase.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//

import Foundation

protocol GetCoinListUseCaseType {
    func execute() async -> Result<[Coin], CryptoFailure>
}

class GetCoinListUseCase: GetCoinListUseCaseType {
    let repository: CoinRepositoryType
    
    init(repository: CoinRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Coin], CryptoFailure> {
       let result = await repository.getAll()

        guard case .success(let coins) = result else {
            return .failure(.serverError)
        }
        
        return .success(coins.sorted { $0.rank < $1.rank})
    }
}
