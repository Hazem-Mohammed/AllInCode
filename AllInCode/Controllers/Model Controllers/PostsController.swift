//
//  PostsController.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class PostsController {
    
    private init() {}
    
    static let shared = PostsController()
    
    func fetchPosts(completionHandler: @escaping (_ status: NetworkRequestStatus, _ response: [PostResponse]?) -> Void) {
        
        NetworkController.shared.fetchPosts { (status, responseData) in
            
            completionHandler(status , responseData)
        }
    }
    
}
