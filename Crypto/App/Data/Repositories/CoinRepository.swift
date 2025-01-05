//
//  CoinRepository.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
class CoinRepository: CoinRepositoryType {
    
    private let api: CryptoApi
    private let failureMapper: CryptoFailureMapper
    
    init(api: CryptoApi, failureMapper: CryptoFailureMapper) {
        self.api = api
        self.failureMapper = failureMapper
    }
    
    func getAll() async -> Result<[Coin], CryptoFailure> {
        let apiResult = await api.getCoinList()
        
        guard case .success(let dtoList) = apiResult else {
            return .failure(failureMapper.map(error: apiResult.failureValue))
        }
        
        let coins = dtoList.map { $0.toCoin()}
        return .success(coins)
    }
    
}
