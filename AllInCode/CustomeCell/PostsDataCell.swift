//
//  DataCell.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class PostsDataCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var bodyLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViewToSuperView()
        configureTitleLabel()
        configureBodyLabel()
        setTitleLabelConstraint()
        setBodyLabelConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellData(posts: PostResponse) {
        
        titleLabel.text = posts.title
        bodyLabel.text = posts.body
    }
    
    func addSubViewToSuperView() {
        
        addSubview(titleLabel)
        addSubview(bodyLabel)
    }
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 0
    }
    
    func configureBodyLabel() {
        bodyLabel.numberOfLines = 0
    }
    
    func setTitleLabelConstraint() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
    }
    
    func setBodyLabelConstraint() {
        
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textColor = UIColor.blue
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
    }
    
    
}
