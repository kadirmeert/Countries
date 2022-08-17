//
//  CountriesViewController.swift
//  Countries
//
//  Created by Kadır  Yıldız on 15.08.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import Foundation


class CountriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countriesList = [CountriesModel]()
    var favListArray: NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favListArray.removeAllObjects()
        
        tabBarController?.tabBar.tintColor = UIColor.black
        self.getCountrieList()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.favListArray.removeAllObjects()
        if UserDefaults.standard.object(forKey: "favList") != nil {
            
            favListArray = NSMutableArray.init(array: UserDefaults.standard.object(forKey: "favList") as! NSArray? ?? [])
        }
    }
 
    
    func getCountrieList() {
        
        Alamofire.request("https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10", method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers:AuthConstants.headers).responseObject{(response: DataResponse<CountrieResponseModel>) in
            
            if let countriesResponse = response.result.value {
                self.countriesList = countriesResponse.results
                self.tableView.reloadData()
                
            } else {
                
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? CountriesDetailViewController {
                if let country = sender as? CountriesModel {
                    detailVC.selectedCountries = country
                }
            }
        }
    }
}

extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countriesList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countriesCell = tableView.dequeueReusableCell(withIdentifier: "CountriesCell", for: indexPath) as! CountriesTableViewCell
        
        
        if favListArray.contains(countriesCell.countriesLabel.text!) {

            countriesCell.favoriteImage.image = UIImage(systemName:"star.fill")
            
        }else{
            
            countriesCell.favoriteImage.image = UIImage(systemName:"star")
        }
        
        countriesCell.favoriteButton.tag = indexPath.row
        countriesCell.favoriteButton.addTarget(self, action:#selector(addToFav) , for: UIControl.Event.touchUpInside)
        
        let selectedCountries = self.countriesList[indexPath.item]
        countriesCell.prepareCell(countries: selectedCountries)
        
        return countriesCell
    }
    
    @objc func addToFav(sender:UIButton) {
        
        
        let cell = self.tableView.cellForRow(at: IndexPath.init(row: sender.tag, section: 0) as IndexPath) as! CountriesTableViewCell
        
        if favListArray.contains(cell.countriesLabel.text!) {
            favListArray.remove(cell.countriesLabel.text!)
            
        }else{
            favListArray.add(cell.countriesLabel.text!)
        }
        
        UserDefaults.standard.set(favListArray, forKey: "favList")
        tableView.reloadData()
    }
    
    func tableView(_ collectionView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = self.countriesList[indexPath.item]
        self.performSegue(withIdentifier: "showDetail" , sender: selectedCountry)
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

