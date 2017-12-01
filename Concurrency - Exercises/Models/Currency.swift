//
//  Currency.swift
//  Concurrency - Exercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct Currency: Codable {
    let base: String
    let rates: [String:Double]
}
