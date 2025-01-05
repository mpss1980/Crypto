//
//  CryptoFailureMapper.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
class CryptoFailureMapper {
    func map(error: HttpClientError?) -> CryptoFailure {
        guard error == .tooManyRequests else {
            return .generic
        }
        
        return .serverError
    }
}
