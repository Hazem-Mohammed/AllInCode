//
//  UITableViewExtension.swift
//  AllInCode
//
//  Created by Vortex on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: T.className)
    }
    
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
}
