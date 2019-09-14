//
//  NetworkLayer.swift
//  AllInCode
//
//  Created by Vortex on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation
import Alamofire

class NetworkLayer {
    
    //Create our session manager to keep track of requests
    private let manager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForResource = 60
        configuration.timeoutIntervalForRequest = 60
        return SessionManager(configuration: configuration)
    }()
    
    //Generic function for requesting and decoding. Also makes use of Swift's new API "Result"
    //Notice I used Swift.Result since Result will be shadowed by Alamofire own implementation of Result (which has been removed in Alamofire 5 anyway)
    //This function also returns the request in case you need to keep reference for it, to cancel it maybe ?
    @discardableResult func request<T>(_ request: URLRequestConvertible, decodedTo: T.Type, completionHandler: @escaping (Swift.Result<T, Error>) -> ()) -> DataRequest where T: Codable {
        return manager.request(request).responseData { response in
            //Do necessary validation on requests here, status codes etc..
            //Complete with failure (like in the "failure" case) if any of your preconditions fail
            switch response.result {
            case .success(let data):
                do {
                    let data = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(data))
                } catch {
                    completionHandler(.failure(NetworkRequestStatus.decodingError))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    //To be able to cancel all requests
    func cancelAllRequests() {
        manager.session.getAllTasks { tasks in
            tasks.forEach { task in
                task.cancel()
            }
        }
    }
}
