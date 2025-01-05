//
//  HttpClient.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
import Foundation

protocol HttpClient {
    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HttpClientError>
}
