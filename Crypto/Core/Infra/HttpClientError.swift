//
//  HttpError.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
enum HttpClientError: Error {
    case clientError
    case serverError
    case generic
    case parsissionError
    case invalidUrl
    case invalidResponse
    case tooManyRequests
}
