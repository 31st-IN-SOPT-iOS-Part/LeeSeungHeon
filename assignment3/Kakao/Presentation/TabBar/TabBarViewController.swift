//
//  TabBarViewController.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension TabBarViewController {
    private func setUI() {
        view.backgroundColor = UIColor(named: "Background")
        view.tintColor = UIColor(named: "Font")
    }
    
    private func setLayout() {
        let viewControllers: [UINavigationController] = [
            createTabBarItem(tabBarImage: "friendTabIcon_selected", viewController: FriendViewController()),
            createTabBarItem(tabBarImage: "messageTabIcon", viewController: ChatViewController()),
            createTabBarItem(tabBarImage: "searchTabIcon", viewController: HashTagViewController()),
            createTabBarItem(tabBarImage: "shopTabIcon", viewController: ShoppingViewController()),
            createTabBarItem(tabBarImage: "detailTabIcon", viewController: MoreViewController())
        ]
        
        setViewControllers(viewControllers, animated: false)
    }
    
    private func createTabBarItem(tabBarImage: String, viewController: UIViewController) -> UINavigationController {
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        
        navigationController.tabBarItem.image = UIImage(named: tabBarImage)
        navigationController.navigationBar.backgroundColor = .white
        navigationController.navigationBar.barTintColor = .white
        navigationController.navigationBar.tintColor = .black
                
        return navigationController
    }
}
