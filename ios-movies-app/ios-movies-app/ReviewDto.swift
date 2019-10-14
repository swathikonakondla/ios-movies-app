//
//  Review.swift
//  ios-movies-app
//  Created by Swathi on 05/10/2019.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Foundation
import ObjectMapper

class ReviewDto: Mappable {
    var id: String?
    var author: String?
    var content: String?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        author <- map["author"]
        content <- map["content"]
    }
}
