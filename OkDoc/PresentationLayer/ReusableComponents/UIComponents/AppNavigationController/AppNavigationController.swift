//
//  AppNavigationController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 03.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        let popViewController = super.popViewController(animated: animated)
        return popViewController
    }
}
