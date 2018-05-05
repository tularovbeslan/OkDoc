//
//  StoryboardInitializable.swift
//  OkDoc
//
//  Created by Beslan Tularov on 03.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

protocol StoryboardInitializable {
    static var name: String { get }
    static var bundle: Bundle? { get }
    
    static func fromStoryboard() -> Self
    func embedInNavigation(item: UITabBarItem) -> UINavigationController
}

extension StoryboardInitializable where Self : UIViewController {
    static var name: String {
        return String(describing: Self.self)
    }
    
    static var bundle: Bundle? {
        return nil
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func fromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateViewController(
            withIdentifier: identifier) as! Self
    }
    
    func embedInNavigation(item: UITabBarItem) -> UINavigationController {
        let navigation = embedInNavigation()
        navigation.tabBarItem = item
        return navigation
    }
    
    func embedInNavigation() -> UINavigationController {
        let navigation = AppNavigationController(navigationBarClass: nil, toolbarClass: nil)
        navigation.viewControllers = [self]
        return navigation
    }
    
    func embedInDefaultNavigation() -> UINavigationController {
        let navigation = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.barTintColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)
        navigation.viewControllers = [self]
        return navigation
    }
    
    func withTabbar(item: UITabBarItem) -> Self {
        self.tabBarItem = item
        return self
    }
}
