//
//  MoneyFormatterTests.swift
//  MoneyCore
//
//  Created by Mousa, Anastasia on 27/11/26.
//

import Foundation
import Testing
@testable import MoneyCore

@Test
func formatsEURUsingUSLocale() {
    let formatter = MoneyFormatter(locale: Locale(identifier: "en_US"))
    let money = Money(amount: 1234.56, currency: .eur)
    let result = formatter.string(from: money)

    #expect(result.contains("1,234.56"))
}

@Test
func formatsEURUsingGreekLocale() {
    let formatter = MoneyFormatter(locale: Locale(identifier: "el_GR"))
    let money = Money(amount: 1234.56, currency: .eur)
    let result = formatter.string(from: money)

    #expect(result.contains("1.234,56"))
}

@Test
func formatsJPYWithoutFractionDigits() {
    let formatter = MoneyFormatter(locale: Locale(identifier: "en_US"))
    let money = Money(amount: 1234, currency: .jpy)
    let result = formatter.string(from: money)

    #expect(!result.contains(".00"))
}

@Test
func formatsKWDWithThreeFractionDigits() {
    let formatter = MoneyFormatter(locale: Locale(identifier: "en_US"))
    let money = Money(amount: 12.345, currency: .kwd)
    let result = formatter.string(from: money)

    #expect(result.contains("12.345"))
}

@Test
func formatsZeroAmount() {
    let formatter = MoneyFormatter(locale: Locale(identifier: "en_US"))
    let money = Money(amount: 0, currency: .eur)
    let result = formatter.string(from: money)

    #expect(result.contains("0.00"))
}

@Test
func formatsNegativeAmount() {
    let formatter = MoneyFormatter(locale: Locale(identifier: "en_US"))
    let money = Money(amount: -1234.56, currency: .usd)
    let result = formatter.string(from: money)

    #expect(result.contains("-"))
    #expect(result.contains("1,234.56"))
}

@Test
func roundsToCurrencyMinorUnits() {
    let formatter = MoneyFormatter(locale: Locale(identifier: "en_US"))
    let money = Money(amount: 12.3456, currency: .kwd)
    let result = formatter.string(from: money)

    #expect(result.contains("12.346"))
}
