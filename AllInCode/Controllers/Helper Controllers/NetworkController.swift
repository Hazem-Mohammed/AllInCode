//
//  NetworkController.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class NetworkController {
    
    private init() {}
    
    static let shared = NetworkController()
    
    private var baseURL: String = "https://jsonplaceholder.typicode.com/"
    
    private enum API: String {
        
        case posts = "posts"
    }
    
    func fetchPosts(completionHandler: @escaping (_ status: NetworkRequestStatus, _ response: [PostResponse]?) -> Void) {
        
        NetworkActivityIndicatorController.shared.showIndicator()
        
        
        guard let url = URL(string: "\(baseURL)\(API.posts.rawValue)") else {
            
            NetworkActivityIndicatorController.shared.hideIndicator()
            completionHandler(.error,nil)
            return
        }
        
        Alamofire.request(url, method: .get).responseJSON { (dataResponse) in
            
            switch dataResponse.result {
                
            case .success(let response):
                
                let postDataResponse = Mapper<PostResponse>().mapArray(JSONArray: response as! [[String : Any]])
                //print("PRINT : \(String(describing: postDataResponse))")
                
                completionHandler(.success , postDataResponse)
                
            case .failure(let error):
                
                print("ERROR IS : \(error)")
                if let errors = dataResponse.error {
                    if errors.localizedDescription.contains("timed out") {
                        completionHandler(.timeout, nil)
                    } else {
                        completionHandler(.error, nil)
                    }
                }
            }
        }
    }
}
