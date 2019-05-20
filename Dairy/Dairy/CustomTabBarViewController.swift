//
//  CustomTabBarViewController.swift
//  Dairy
//
//  Created by Chunsu Kim on 20/05/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    
    let tabBarItemQuantity = 3
    let backgroundView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    func configure() {
        backgroundView.backgroundColor = .white
        backgroundView.alpha = 0.4
        backgroundView.isHidden = true
        
        tabBar.isTranslucent = false
        tabBar.tintColor = #colorLiteral(red: 0.1039802805, green: 0.2768733501, blue: 0.3995706141, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.460631609, green: 0.8378008604, blue: 0.9999235272, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)], for: .normal)
        
        view.addSubview(backgroundView)
        
        let firstTab = ViewController()
        let firstTabBarItem = UITabBarItem(title: "기록", image: nil, selectedImage: nil)
        firstTab.tabBarItem = firstTabBarItem
        firstTab.view.backgroundColor = .white
        
        let secondTab = ViewController()
        let secondTabBarItem = UITabBarItem(title: "열람", image: nil, selectedImage: nil)
        secondTab.tabBarItem = secondTabBarItem
        secondTab.view.backgroundColor = .white
        
        let thirdTab = ViewController()
        let thridTabBarItem = UITabBarItem(title: "설정", image: nil, selectedImage: nil)
        thirdTab.tabBarItem = thridTabBarItem
        thirdTab.view.backgroundColor = .white
        
        self.viewControllers = [firstTab, secondTab, thirdTab]
    }

    
}
