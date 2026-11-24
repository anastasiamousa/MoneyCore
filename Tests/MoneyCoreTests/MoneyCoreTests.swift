import Foundation
import Testing
@testable import MoneyCore

@Test
func createsMoneyWithAmountAndCurrency() {
    let money = Money(
        amount: 10,
        currency: .eur
    )

    #expect(money.amount == 10)
    #expect(money.currency == .eur)
}

@Test
func currenciesExposeCorrectMinorUnits() {
    #expect(Currency.eur.minorUnits == 2)
    #expect(Currency.chf.minorUnits == 2)
    #expect(Currency.jpy.minorUnits == 0)
    #expect(Currency.kwd.minorUnits == 3)
}
