//
//  MoneyParserTests.swift
//  MoneyCore
//
//  Created by Mousa, Anastasia on 27/11/26.
//

import Foundation
import Testing
@testable import MoneyCore

//US
@Test
func parsesUSFormattedAmount() throws {
    let parser = MoneyParser(locale: Locale(identifier: "en_US"))
    let money = try parser.parse("1,234.56", currency: .usd)

    #expect(money.amount == Decimal(string: "1234.56"))
    #expect(money.currency == .usd)
}

//GR
@Test
func parsesGreekFormattedAmount() throws {
    let parser = MoneyParser(locale: Locale(identifier: "el_GR"))
    let money = try parser.parse("1.234,56", currency: .eur)

    #expect(money.amount == Decimal(string: "1234.56"))
}

@Test
func trimsWhitespaceBeforeParsing() throws {
    let parser = MoneyParser(locale: Locale(identifier: "en_US"))
    let money = try parser.parse("  123.45  ",currency: .usd)

    #expect(money.amount == Decimal(string: "123.45"))
}

@Test
func throwsForEmptyInput() {
    let parser = MoneyParser(locale: Locale(identifier: "en_US"))

    #expect(throws: MoneyParseError.emptyInput) {
        try parser.parse("   ", currency: .usd)
    }
}

@Test
func throwsForInvalidInput() {
    let parser = MoneyParser(locale: Locale(identifier: "en_US"))

    #expect(throws: MoneyParseError.invalidAmount) {
        try parser.parse("hellooo", currency: .usd)
    }
}

@Test
func parsesNegativeAmount() throws {
    let parser = MoneyParser(locale: Locale(identifier: "en_US"))
    let money = try parser.parse("-123.45", currency: .usd)

    #expect(money.amount == Decimal(string: "-123.45"))
}
