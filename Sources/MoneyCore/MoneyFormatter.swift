//
//  MoneyFormatter.swift
//  MoneyCore
//
//  Created by Mousa, Anastasia on 27/11/26.
//

import Foundation

public struct MoneyFormatter {
    
    private let locale: Locale

    public init(locale: Locale = .current) {
        self.locale = locale
    }

    public func string(from money: Money) -> String {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.numberStyle = .currency
        formatter.currencyCode = money.currency.rawValue
        formatter.minimumFractionDigits = money.currency.minorUnits
        formatter.maximumFractionDigits = money.currency.minorUnits

        return formatter.string(from: money.amount as NSDecimalNumber) ?? "\(money.amount)"
    }
}
