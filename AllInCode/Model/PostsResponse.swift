//
//  PostsResponse.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostResponse: Mappable {
    
    var title: String
    var body: String
    
    init?(map: Map) {
        
        title = ""
        body = ""
    }
    
    init(){
        
        title = ""
        body = ""
    }
    
    mutating func mapping(map: Map) {
        
        title <- map["title"]
        body <- map["body"]
    }
}
