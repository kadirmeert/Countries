//
//  CountriesDetailViewController.swift
//  Countries
//
//  Created by Kadır  Yıldız on 16.08.2022.
//

import Foundation
import UIKit


class CountriesDetailViewController: UIViewController {
    @IBOutlet weak var countriesLabel: UILabel!
    @IBOutlet weak var countriesImage: UIImageView!
    @IBOutlet weak var countriesCode: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    //MARK: Properties
    
    var selectedCountries = CountriesModel(JSON: ["" : ""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.prepareUI()
    }
    
    func prepareUI() {
        self.infoButton.dropShadow(cornerRadius: 7)
       
        
        self.countriesLabel.text = self.selectedCountries?.name
        self.countriesCode.text = "Country Code: \(self.selectedCountries?.code ?? "")"
       
        
    }
    
    
    @IBAction func infoBtnPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.wikidata.org/wiki/\(selectedCountries?.wikiDataId ?? "")") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
}
