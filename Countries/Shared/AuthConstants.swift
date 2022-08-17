//
//  AuthConstants.swift
//  Countries
//
//  Created by Kadır  Yıldız on 16.08.2022.
//

import Foundation

struct AuthConstants {
    
    static var xApiKey = "35210d9bbbmsha663d1674e65494p1639f6jsnf73033741c05"
    static var xapiHost = "wft-geo-db.p.rapidapi.com"
    static var headers = [
        "X-RapidAPI-Key": "\(AuthConstants.xApiKey)",
        "X-RapidAPI-Host": "\(AuthConstants.xapiHost)",
    ]
}
