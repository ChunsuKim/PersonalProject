//
//  CustomTabBarViewController.swift
//  Mymood
//
//  Created by LEE HAEUN on 2019. 5. 6..
//  Copyright © 2019년 LEE HAEUN. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarViewController : UITabBarController, UITabBarControllerDelegate {
    let viewItemCount = 3
    lazy var alphaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.4
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.tintColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)], for: .normal)

        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self

        view.addSubview(alphaView)
        
        alphaView.isHidden = true
        
        let tabOne = ViewController()
        let tabOneBarItem = UITabBarItem(title: "기록", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        tabOne.tabBarItem = tabOneBarItem
        tabOne.view.backgroundColor = .white
        
        let tabTwo = ViewController()
        let tabTwoBarItem = UITabBarItem(title: "열람", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        tabTwo.tabBarItem = tabTwoBarItem
        tabTwo.view.backgroundColor = .white

        let tabThree = ViewController()
        let tabThreeBarItem = UITabBarItem(title: "설정", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        tabThree.tabBarItem = tabThreeBarItem
        tabThree.view.backgroundColor = .white

        self.viewControllers = [tabOne,tabTwo,tabThree]

    }
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        alphaView.isHidden = false
//        let itemWidth = tabBar.bounds.width / CGFloat(viewItemCount)
//        var tabBarIndex = tabBarController.selectedIndex
//        let currentMaxX = itemWidth * CGFloat(tabBarIndex)
//        if tabBarIndex != 0 {
//            tabBarIndex -= 1
//        }else{
//            tabBarIndex = 0
//        }
//        let currentMinX = itemWidth * CGFloat(tabBarIndex)
//        //        bannerAd.frame = CGRect(x: currentMaxX + 10, y: self.view.bounds.maxY - CGFloat(tabBar.frame.height/2) - 10, width: 0, height: 18)
//
//        UIView.animate(withDuration: 1, animations: {
//            self.alphaView.frame = CGRect(x: currentMaxX + 10, y: self.view.bounds.maxY - CGFloat(self.tabBar.frame.height/2) - 10, width: itemWidth - 20, height: 18)
//
//        },completion: { _ in
//            //            self.bannerAd.isHidden = true
//        })
//    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        alphaView.frame = CGRect(x: 0, y: self.view.bounds.maxY - CGFloat(tabBar.frame.height/2) - 10, width: 0, height: 18)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
}
