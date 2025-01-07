//
//  CoinGeckApi.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
import Foundation

class CoinGeckoApi: CryptoApi {
    
    private let httpClient: HttpClient
    
    private let baseUrl: String = "https://api.coingecko.com/api/v3/"
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
       
    func getCoinList() async -> Result<[CoinDto], HttpClientError> {
        let queryParameters: [String : Any] = [
            "vs_currency": "brl",
            "order": "market_cap_desc",
            "per_page": 200,
            "sparkline": true,
            "price_change_percentage": "24h"
        ]
        let endpoint = Endpoint(path: "coins/markets", queryParameters: queryParameters, method: .get)
        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: baseUrl)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue))
        }
        
        guard let response = try? JSONDecoder().decode([CoinDto].self, from: data) else {
            return .failure(.parsissionError)
        }
        
        return .success(response)
    }
    
    private func handleError(error: HttpClientError?) -> HttpClientError {
        guard let error else {
            return .generic
        }
        return error
    }
}
