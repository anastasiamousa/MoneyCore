//
//  MoneyParser.swift
//  MoneyCore
//
//  Created by Mousa, Anastasia on 27/11/26.
//

import Foundation

public struct MoneyParser {
    
    private let locale: Locale

    public init(locale: Locale = .current) {
        self.locale = locale
    }

    public func parse(_ input: String, currency: Currency) throws -> Money {
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedInput.isEmpty else {
            throw MoneyParseError.emptyInput
        }

        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .decimal
        formatter.generatesDecimalNumbers = true

        guard let number = formatter.number(from: trimmedInput), let decimal = number as? NSDecimalNumber else {
            throw MoneyParseError.invalidAmount
        }

        return Money(amount: decimal.decimalValue, currency: currency)
    }
}
