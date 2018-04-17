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
        self.tabBar.isTranslucent   = false
    }
    
    var controllers: [UIViewController] {
        let categorySelection = CategorySelectionViewController.fromStoryboard().withTabbar(item: TabBarItems.home.item).embedInNavigation()
        let dosctorsList = DoctorsListViewController.fromStoryboard().withTabbar(item: TabBarItems.message.item).embedInNavigation()
        let profile = ProfileViewController.fromStoryboard().withTabbar(item: TabBarItems.profile.item).embedInNavigation()
        return [categorySelection, dosctorsList, profile]
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
