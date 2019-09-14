//
//  DataCell.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    //It should be private and you should do all initial setup in this closure
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .blue //Use type inference when possible, .blue instead of UIColor.blue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //This function should always be called configure, and it should accept a "post" not posts
    func configure(post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
    //This function should be called addSubviews there's no need for the "ToSuperView" also "Subview" is just one word so you don't get to call it SubView
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
    }
    
    //Use setup instead of "set"
    private func setupTitleLabelConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
    }
    
    //Same goes for this
    private func setupBodyLabelConstraint() {
        //By setting body label bottom anchor we'll take advantage of autolayout to do all the necessary calculations for us, no fixed row heights.
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    
    //One function to do all the layout
    private func layoutUI() {
        addSubviews()
        setupTitleLabelConstraint()
        setupBodyLabelConstraint()
    }
    
}
