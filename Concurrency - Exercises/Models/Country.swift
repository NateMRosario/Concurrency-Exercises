//
//  Country.swift
//  Concurrency - Exercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct Country: Codable {
    let alpha2Code: String
    let alpha3Code: String
    let name: String
    let capital: String?
    let flag: String
    let population: Int
    let currencies: [CurrencyWrapper]
}
struct CurrencyWrapper: Codable {
    let code: String
}
