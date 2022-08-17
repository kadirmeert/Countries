//
//  CountrieRequest.swift
//  Countries
//
//  Created by Kadır  Yıldız on 15.08.2022.
//

import Foundation
import ObjectMapper

class CountrieResponseModel: Mappable {
    
    public var results: [CountriesModel] = [CountriesModel]()
    
    required init?(map: Map) {
        if map.JSON["data"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        results <- map["data"]
    }
}
