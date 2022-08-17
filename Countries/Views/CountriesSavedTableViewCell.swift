//
//  CountriesSavedTableViewCell.swift
//  Countries
//
//  Created by Kadır  Yıldız on 15.08.2022.
//

import Foundation
import UIKit


class CountriesSavedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var savedInnerView: UIView!
    @IBOutlet weak var savedCountryName: UILabel!
    @IBOutlet weak var savedImage: UIImageView!
    @IBOutlet weak var savedButton: UIButton!
    
    
    var countrySavedList = [CountriesModel]()
    var selectedCountries = CountriesModel(JSON: ["" : ""])
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.savedInnerView.dropShadow(cornerRadius: 12)
        self.savedInnerView.layer.borderColor = UIColor.black.cgColor
        self.savedInnerView.layer.borderWidth = 1
        self.savedInnerView.layer.cornerRadius = 8
        self.savedInnerView.clipsToBounds = true
        
        
        
    }
    
    func prepareCell(countries: CountriesModel) {
        self.savedCountryName.text = countries.name
        //        self.likeNumberCount.text = movie.likeNumber
        //        self.directorLabel.text = movie.directorName
        //        self.logoImageView.image = UIImage(named: movie.imageName)
        //        self.dateLabel.text = movie.releasedate.changeDateFormat()
        
        
    }
    @IBAction func savedBtnPressed(_ sender: UIButton) {
        
    }
    
    
}
