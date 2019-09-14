//
//  MainVC.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    private var tableView = UITableView()
    private var postsList: [PostResponse] = []
    private let progressHUD = ProgressHUD(text: "Loading...")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fetchPostsData()
    }
    
    private enum CellName: String {
        
        case postsCell = "PostsCell"
    }
    
    func configureTableView() {
        
        setTableViewDelegate()
        setTableViewDefaultRowHeight()
        setTableViewConstraint()
        registerTableViewCell()
    }
    
    func setTableViewDelegate() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerTableViewCell() {
        
        tableView.register(PostsDataCell.self, forCellReuseIdentifier: "\(CellName.postsCell)")
    }
    
    func setTableViewDefaultRowHeight() {
        
        tableView.rowHeight = 200
    }
    
    func setTableViewConstraint() {
        
        view.addSubview(tableView)
        tableView.pin(to: view)
    }
    
    func fetchPostsData() {
        
        view.addSubview(progressHUD)
        
        PostsController.shared.fetchPosts { [weak self] (status, responseData) in
            
            DispatchQueue.main.async {
                
                self?.progressHUD.removeFromSuperview()
                
                switch status {
                    
                case .success:
                    //print("request succeeded...")
                    if let posts = responseData {
                        
                        print("🥳 We Have A Response 🥳")
                        //print("RESPONSE DATA IS : \(posts)")
                        for po in posts {
                            self?.postsList.append(po)
                        }
                        self?.tableView.reloadData()
                        
                    } else {
                        print("ERRRRRROR")
                    }
                    
                case .decodingError:
                    
                    print("REQUEST FAILED : \(status)")
                    
                default:
                    print("REQUEST FAILED : \(status)")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellName.postsCell)") as! PostsDataCell
        
        let posts = postsList[indexPath.row]
        
        cell.setupCellData(posts: posts)
        
        return cell
    }

}
