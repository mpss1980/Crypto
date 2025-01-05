//
//  CryptoFailure.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
enum CryptoFailure: Error {
    case generic
    case serverError
    case invalidData
    case invalidParameter
}
