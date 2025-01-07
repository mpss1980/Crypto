//
//  Double.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//

import Foundation

extension Double {

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }

    func asCurrencyWithDecimals(maximumFractionDigits: Int?) -> String {
        if (maximumFractionDigits != nil) {
            var formatter = currencyFormatter.copy() as! NumberFormatter
            formatter.maximumFractionDigits = maximumFractionDigits!
            return formatter.string(from: NSNumber(value: self)) ?? "0,00"
        }
        
        return currencyFormatter.string(from: NSNumber(value: self)) ?? "0,00"
    }

    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }

    func asPercentageString() -> String {
        return asNumberString() + "%"
    }
}
