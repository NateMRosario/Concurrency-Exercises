//
//  CountryTableViewCell.swift
//  Concurrency - Exercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
