//
//  NetworkRequestStatus.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation

enum NetworkRequestStatus: Error, LocalizedError {
    
    /// Request failed.
    case error
    
    /// Request timed out.
    case timeout
    
    /// Parsing response failed.
    case parsingError
    
    /// Decoding repsonse failed.
    case decodingError
    
    /// Encoding repsonse failed.
    case encodingError
    
    /// Percent encoding URL failed.
    case invalidPercentEncoding
    
    /// One or both of credential parameters are not correct.
    case invalidCredentials
    
    var errorDescription: String? {
        switch self {
            //Implement string for each status
        case .decodingError:
            return "Decoding Failed"
        default:
            return "Error"
        }
    }
}
