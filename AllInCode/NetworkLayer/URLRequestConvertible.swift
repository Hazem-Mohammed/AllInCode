//
//  URLRequestConveritble.swift
//  AllInCode
//
//  Created by Vortex on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    
}
