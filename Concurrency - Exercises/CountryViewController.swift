//
//  ViewController.swift
//  Concurrency - Exercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    var countries = [Country]()
    
    var searchTerm = " " {
        didSet {
            loadCountries()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self; tableView.dataSource = self
        searchBar.delegate = self
        loadCountries()
    }
    
    func loadCountries() {
        let url = "https://restcountries.eu/rest/v2/name/\(searchTerm)"
        let setOnlineCountry: ([Country]) -> Void = {(onlineCountry: [Country]) in
            self.countries = onlineCountry
            self.tableView.reloadData()
        }
        
        CountryAPIClient.manager.getCountries(from: url, completionHandler: setOnlineCountry, errorHandler: {print($0)})
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CountryDetailViewController {
            destination.country = countries[tableView.indexPathForSelectedRow!.row]
        }
    }
}
extension CountryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let countryCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryTableViewCell else {return UITableViewCell()}
        let country = countries[indexPath.row]
        
        countryCell.nameLabel.text = "Country: \(country.name)"
        countryCell.capitalLabel.text = "Capital: \(country.capital ?? "")"
        countryCell.populationLabel.text = "Population: \(country.population)"
        countryCell.countryImageView.image = nil
        
        ImageAPIClient.manager.getImage(from: "http://www.geognos.com/api/en/countries/flag/\(country.alpha2Code).png", completionHandler: {countryCell.countryImageView.image = $0}, errorHandler: {print($0)})
        countryCell.setNeedsLayout()
        
        return countryCell
    }
}
extension CountryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTerm = searchBar.text!
    }
    
}
