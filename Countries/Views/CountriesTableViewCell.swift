//
//  CountriesTableViewCell.swift
//  Countries
//
//  Created by Kadır  Yıldız on 15.08.2022.
//

import Foundation
import UIKit



class CountriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var countriesLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var isFavorite = false
    var countryList = [CountriesModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.innerView.dropShadow(cornerRadius: 12)
        self.innerView.layer.borderColor = UIColor.black.cgColor
        self.innerView.layer.borderWidth = 1
        self.innerView.layer.cornerRadius = 8
        self.innerView.clipsToBounds = true
        
    }
    
    func prepareCell(countries: CountriesModel) {
        self.countriesLabel.text = countries.name

    }
    
    @IBAction func favoriteBtnPressed(_ sender: Any) {
        
       // self.favoriteImage.image = UIImage(systemName:"star.fill")
    }
    
}
    



