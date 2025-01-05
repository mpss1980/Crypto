//
//  CoinRepositoryType.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
protocol CoinRepositoryType {
    func getAll() async -> Result<[Coin], CryptoFailure>
}
