//
//  TabBarController.swift
//  Instagram_Clone
//
//  Created by 정은희 on 2022/04/22.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    private var tabs: [UIViewController] = [ ]

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarItems()
        setTabBarAppearance()
    }
    
    // MARK: - Functions
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.frame.size.height = 84
        tabBar.frame.origin.y = view.frame.height - 84
    }
    
    private func setTabBarItems() {
        tabs = [
            UINavigationController(rootViewController: HomeViewController.instanceFromNib()),
            UINavigationController(rootViewController: SearchViewController.instanceFromNib()),
            UINavigationController(rootViewController: ReelsViewController.instanceFromNib()),
            UINavigationController(rootViewController: ShopViewController.instanceFromNib()),
            UINavigationController(rootViewController: ProfileViewController.instanceFromNib())
        ]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: true)
    }
    
    private func setTabBarAppearance() {
        UITabBar.appearance().backgroundColor = Const.Color.white
        UITabBar.appearance().tintColor = Const.Color.black
        UITabBar.appearance().unselectedItemTintColor = Const.Color.black
    }
}
