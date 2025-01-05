//
//  URLSessionHttpClient.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
import Foundation

class URLSessionHttpClient: HttpClient {

    private let session: URLSession
    private let requestMaker: UrlSessionRequestMaker
    private let errorResolver: UrlSessionErrorResolver

    init(session: URLSession = .shared, requestMaker: UrlSessionRequestMaker, errorResolver: UrlSessionErrorResolver) {
        self.session = session
        self.requestMaker = requestMaker
        self.errorResolver = errorResolver
    }

    func makeRequest(endpoint: Endpoint, baseUrl: String) async -> Result<Data, HttpClientError> {
        guard let url = requestMaker.url(endpoint: endpoint, baseUrl: baseUrl)
        else {
            return .failure(.invalidUrl)
        }

        do {
            let result = try await session.data(from: url)
            
            guard let response = result.1 as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            guard response.statusCode == 200 else {
                return .failure(errorResolver.resolve(statusCode: response.statusCode))
            }
            
            return .success(result.0)
        } catch {
            return .failure(errorResolver.resolve(error: error))
        }
    }
}
