//
//  MainVC.swift
//  AllInCode
//
//  Created by Hazem Mohammed on 9/14/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    //Ideally you can do it like that private let mainView = PostView()
    //But since your ProgressHUD is using frames in order to position itself that's why we are initializing it with view.frame
    private lazy var mainView: PostView = {
       return PostView(frame: view.frame)
    }()
    
    //Posts instead of postList
    private var posts = [Post]()
    
    private let progressHUD = ProgressHUD(text: "Loading...")
    private let postsRepository = PostsRepository()
    
    override func loadView() {
        //Ideally you shouldn't call super.loadView() but we need the view frame for the progresshud
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchPosts()
    }
    
    private func setupTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
//        mainView.tableView.rowHeight = 250 //Let's take advatnage of autolayout
        mainView.tableView.register(PostCell.self)
    }
    
    //Use private functions whenever possible
    //Keep the naming simple there's no need to name it "fetchPostsData", "fetchPosts" is enough
    private func fetchPosts() {
        view.addSubview(progressHUD)
        postsRepository.get { [weak self] result in
            guard let self = self else { return }
            self.progressHUD.removeFromSuperview()
            switch result {
            case .success(let posts):
                self.posts.append(contentsOf: posts)
                self.mainView.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
                //If you want to do custom logic based on your error
                if let _ = error as? NetworkRequestStatus {
                    //Do something with that error
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PostCell = tableView.dequeueCell(for: indexPath)
        
        //it's a single post
        let post = posts[indexPath.row]
        cell.configure(post: post)
        
        return cell
    }

}
