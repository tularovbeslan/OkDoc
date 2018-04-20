//
//  AppTabbarController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 03.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class AppTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = controllers
        self.tabBar.isTranslucent = false
    }
    
    var controllers: [UIViewController] {
        let categorySelection = CategorySelectionViewController.fromStoryboard().embedInNavigation(item: TabBarItems.home.item)
        let dosctorsList = CategorySelectionViewController.fromStoryboard().embedInNavigation(item: TabBarItems.message.item)
        let profile = CategorySelectionViewController.fromStoryboard().embedInNavigation(item: TabBarItems.profile.item)
        return [categorySelection, dosctorsList, profile]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}

enum TabBarItems {
    case home
    case message
    case profile
}

extension TabBarItems {
    var item: UITabBarItem {
        switch self {
        case .home:
            return UITabBarItem(title: title, image: #imageLiteral(resourceName: "homeNormal"), selectedImage: #imageLiteral(resourceName: "homeActive"))
        case .message:
            return UITabBarItem(title: title, image: #imageLiteral(resourceName: "messageNormal"), selectedImage: #imageLiteral(resourceName: "messageActive"))
        case .profile:
            return UITabBarItem(title: title, image: #imageLiteral(resourceName: "profileNormal"), selectedImage: #imageLiteral(resourceName: "profileActive"))
        }
    }

    var title: String {
        switch self {
        case .home:
            return "Приёмная"
        case .message:
            return "Консультации"
        case .profile:
            return "Профиль"
        }
    }
}
