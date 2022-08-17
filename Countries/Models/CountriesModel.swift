//
//  CountriesModel.swift
//  Countries
//
//  Created by Kadır  Yıldız on 15.08.2022.
//

import Foundation
import ObjectMapper

//struct CountrieData:Decodable {
//
//    var data: [Code]
//}
//struct Code:Decodable {
//
//    var code : String
//    var currencyCodes : [String]
//    var name : String
//    var wikiDataId : String
//}




class CountriesModel: Mappable {

    public var code: String = ""
    public var currencyCodes: [String] = []
    public var name: String = ""
    public var wikiDataId: String = ""

    required init?(map: Map) {
        if map.JSON["code"] == nil {
            return nil
        }
    }

    func mapping(map: Map) {
        code <- map["code"]
        currencyCodes <- map["currencyCodes"]
        name <- map["name"]
        wikiDataId <- map["wikiDataId"]
    }
}
