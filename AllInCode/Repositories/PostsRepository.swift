//
//  PostsRepository.swift
//  AllInCode
//
//  Created by Vortex on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation

//Each "entity" in your application should be represented by a repository to do all actions related to that entity

//If your application containts local / remote repositories they should be implemented indivdually to keep SRP in place

class PostsRepository {
    
    private let networkLayer = NetworkLayer()
    
    func get(completionHandler: @escaping (Result<[Post], Error>) -> ()) {
        //Create request as necessary
        let request = PostsRouter.get
        
        //Note we were able to pass the completionHandler directly
        networkLayer.request(request, decodedTo: [Post].self, completionHandler: completionHandler)
    }
}
