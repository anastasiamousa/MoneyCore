//
//  MoneyParseError.swift
//  MoneyCore
//
//  Created by Mousa, Anastasia on 27/11/26.
//

public enum MoneyParseError: Error, Equatable {
    case emptyInput
    case invalidAmount
}
