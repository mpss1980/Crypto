//
//  ResultExtensions.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
extension Result {
    var failureValue: Failure? {
        switch self {
        case .failure(let failure):
            return failure
        default:
            return nil
        }
    }
}

