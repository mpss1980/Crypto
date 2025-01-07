//
//  UrlSessionRequestMaker.swift
//  CoinsGeko
//
//  Created by Field on 03/01/25.
//
import Foundation

class UrlSessionRequestMaker {
    func url(endpoint: Endpoint, baseUrl: String) -> URLRequest? {
        var urlComponents = URLComponents(string: baseUrl + endpoint.path)
        let urlQueryItems = endpoint.queryParameters.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        urlComponents?.queryItems = urlQueryItems
        
        if (urlComponents == nil || urlComponents?.url == nil) {
            return nil
        }

        var request = URLRequest(url: urlComponents!.url!)
        request.httpMethod = endpoint.method.description
        request.setValue("CG-rxqRM3cTxvQ2umkJYf7GDL3Z", forHTTPHeaderField: "x-cg-demo-api-key")
        request.setValue("application/json", forHTTPHeaderField: "accept")

        return request;
    }
}
