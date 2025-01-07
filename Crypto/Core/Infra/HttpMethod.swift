//
//  HttpMethod.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
enum HttpMethod {
    case get
    case post
}

extension HttpMethod: CustomStringConvertible {
    var description: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
}
