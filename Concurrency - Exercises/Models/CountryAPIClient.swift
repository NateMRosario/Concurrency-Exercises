//
//  CountryAPIClient.swift
//  Concurrency - Exercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

struct CountryAPIClient {
    private init() {}
    static var manager = CountryAPIClient()
    func getCountries(from urlStr: String, completionHandler: @escaping ([Country]) -> Void, errorHandler: @escaping (Error) -> Void ) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let country = try JSONDecoder().decode([Country].self, from: data)
                completionHandler(country)
            } catch {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}
