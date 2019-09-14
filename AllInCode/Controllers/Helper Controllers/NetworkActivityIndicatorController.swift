//
//  NetworkActivityIndicatorController.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class NetworkActivityIndicatorController {
    
    static let shared = NetworkActivityIndicatorController()
    
    private var semaphore = 0 {
        didSet {
            if semaphore > 0 {
                DispatchQueue.main.async {
                    if UIApplication.shared.isNetworkActivityIndicatorVisible == false {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = true
                    }
                }
            } else {
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    private init () {
        semaphore = 0
    }
    
    func showIndicator () {
        semaphore = semaphore + 1
    }
    
    func hideIndicator () {
        semaphore = semaphore - 1
    }
}
