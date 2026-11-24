//
//  Currency.swift
//  MoneyCore
//
//  Created by Mousa, Anastasia on 24/11/26.
//

public enum Currency: String, CaseIterable, Sendable {
    case eur = "EUR"
    case usd = "USD"
    case gbp = "GBP"
    case chf = "CHF"
    case jpy = "JPY"
    case kwd = "KWD"
}

public extension Currency {
    var minorUnits: Int {
        switch self {
        case .jpy:
            return 0
        case .kwd:
            return 3
        case .eur, .usd, .gbp, .chf:
            return 2
        }
    }
}
