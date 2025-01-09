//
//  GetCoinsUseCase.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//

import Foundation

protocol GetStatisticListUseCaseType {
    func execute() async -> Result<[Statistics], CryptoFailure>
}

class GetStatisticListUseCase: GetStatisticListUseCaseType {
//    let repository: CoinRepositoryType
    
//    init(repository: CoinRepositoryType) {
//        self.repository = repository
//    }
    
    func execute() async -> Result<[Statistics], CryptoFailure> {
//       let result = await repository.getAll()
//
//        guard case .success(let coins) = result else {
//            return .failure(.serverError)
//        }
//        
//        return .success(coins.sorted { $0.rank < $1.rank})
        
        return .success([
            Statistics(id: "123", title: "Title", value: "1.23", percentageChange: 7.0),
            Statistics(id: "124", title: "Title2", value: "1.432", percentageChange: -3.0),
            Statistics(id: "125", title: "Title3", value: "1.3433", percentageChange: nil),
            Statistics(id: "126", title: "Title4", value: "1.23", percentageChange: 34.0),
        ])
    }
}
