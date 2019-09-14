//
//  PostsRouter.swift
//  AllInCode
//
//  Created by Vortex on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation
import Alamofire

enum PostsRouter: URLRequestConvertible {
    
    case get
    //Maybe create a new case to "create a post"
    //case create(parameters: [String: Any])
    
    var method: HTTPMethod {
        switch self {
            //Just because it's named ".get" it means its httpmethod must be get it can be anything else.
        case .get:
            return .get
            //case .create:
                //return .post
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
            //This request has no parameters, maybe something else will have parameters ?
        case .get:
            return nil
            //case .create(let parameters):
                //return parameters
        }
    }
    
    var url: URL {
        let endpoint: String
        switch self {
            //Different endpoints for different network calls
        case .get:
            endpoint = Constants.PostsEndpoints.get
            //etc...
        }
        return URL(string: Constants.baseURL)!.appendingPathComponent(endpoint)
    }
    
    var encoding: ParameterEncoding {
        switch self {
        //Each request should have parameter encoding, when you are sending parameters in the query I.E: ?search=5&pageIndex=1 it's URLEncoding.queryString for most other requests it's going to be JSONEncoding.default
        case .get:
            return URLEncoding.queryString
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        //Finally build the request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
}
