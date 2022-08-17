//
//  CountriesSavedViewController.swift
//  Countries
//
//  Created by Kadır  Yıldız on 15.08.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper


class CountriesSavedViewController: UIViewController {
    
    @IBOutlet weak var savedTableView: UITableView!
    
    var selectedCountries = CountriesModel(JSON: ["" : ""])
    var favCountryList:NSMutableArray = []
    var savedCountriesList = [CountriesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favCountryList.removeAllObjects()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.favCountryList.removeAllObjects()
        if UserDefaults.standard.object(forKey: "favList") != nil {
            
            favCountryList = NSMutableArray.init(array: (UserDefaults.standard.object(forKey: "favList") as! NSArray?) ?? [])
            
            print(favCountryList)
            
            
        }
        self.savedTableView.reloadData()
       
    }
}

extension CountriesSavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favCountryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countriesCell = savedTableView.dequeueReusableCell(withIdentifier: "CountriesSavedCell", for: indexPath) as! CountriesSavedTableViewCell
        
        countriesCell.savedCountryName?.text = favCountryList.object(at: indexPath.row) as? String
        

        return countriesCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

