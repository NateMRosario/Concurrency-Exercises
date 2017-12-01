//
//  CountryDetailViewController.swift
//  Concurrency - Exercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var country: Country?
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var CountryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        guard let country = country else {return}
        nameLabel.text = country.name
        capitalLabel.text = country.capital
        populationLabel.text = "Population: \(country.population )"
        ImageAPIClient.manager.getImage(from: "http://www.geognos.com/api/en/countries/flag/\(country.alpha2Code).png", completionHandler: {self.CountryImageView.image = $0}, errorHandler: {print($0)})
        
        //        currencyLabel.text =
    }

}
