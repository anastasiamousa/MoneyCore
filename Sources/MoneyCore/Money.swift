//
//  Money.swift
//  MoneyCore
//
//  Created by Mousa, Anastasia on 24/11/26.
//

import Foundation

public struct Money: Equatable, Sendable {
    public let amount: Decimal
    public let currency: Currency

    public init(
        amount: Decimal,
        currency: Currency
    ) {
        self.amount = amount
        self.currency = currency
    }
}
