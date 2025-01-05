//
//  CryptoApi.swift
//
//  Created by Field on 05/01/25.
//
protocol CryptoApi {
    func getCoinList() async -> Result<[CoinDto], HttpClientError>
}
