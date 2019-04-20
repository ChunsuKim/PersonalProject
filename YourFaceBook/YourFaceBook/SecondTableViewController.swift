//
//  SecondTableViewController.swift
//  YourFaceBook
//
//  Created by Chunsu Kim on 18/04/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {
    
    var currentUser: User?
    
    var feedDataArr = [FeedData]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }

    func configure() {
        createFeedData()
        naviSetting()

        tableView.dataSource = self
        tableView.separatorColor = .clear
        view.addSubview(tableView)
    }

    func createFeedData() {
        for i in 1...4 {
            let feedData = FeedData(profileImage: AppImageData.profile + "\(i)", nickName: "user\(i)", feedImage: AppImageData.feedImage + "\(i)")
            feedDataArr.append(feedData)
        }


    }

    func tableViewRegister() {
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
    }

    func naviSetting() {
        let naviTitleView = UIImageView(image: UIImage(named: AppImageData.logo))
        naviTitleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = naviTitleView

        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraButtonDidTap(_:))), animated: true)
    }

    @objc private func cameraButtonDidTap(_ sender: UIBarButtonItem) {
        print("camera Button Tap")
    }
    
    func autoLayout() {
        let guide = self.view.safeAreaLayoutGuide
        
        self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       // #warning Incomplete implementation, return the number of sections
        return feedDataArr.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: IndexPath) as! FeedTableViewCell
        
        cell.model = feedDataArr[indexPath.row]
        
        return cell
    }

    
}
