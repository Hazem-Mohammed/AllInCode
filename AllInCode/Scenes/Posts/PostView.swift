//
//  PostView.swift
//  AllInCode
//
//  Created by Vortex on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class PostView: UIView {
    
    var tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white //Since default is black
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Same layout process for any view
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupTableViewConstraints() {
         tableView.pin(to: self)
    }
    
    private func layoutUI() {
        addSubviews()
        setupTableViewConstraints()
    }
}
