//
//  Trailer.swift
//  ios-movies-app
//  Created by Swathi on 05/10/2019.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Foundation
import ObjectMapper

class TrailerDto: Mappable {
    var name: String?
    var size: String?
    var source: String?
    var type: String?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        size <- map["size"]
        source <- map["source"]
        type <- map["type"]
    }
}
