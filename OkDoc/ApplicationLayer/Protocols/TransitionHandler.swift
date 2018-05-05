//
//  TransitionHandler.swift
//  VIPERSwift
//
//  Created by Beslan Tularov on 27.03.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit.UIViewController

typealias ConfigurationBlock<T> = (_ moduleInput: T) -> Void

struct SegueInfo<T> {
    var configurationBlock: ConfigurationBlock<T>?
}

protocol TransitionHandler: class {
    func openModule(segueIdentifier: String)
    func openModule<T>(segueIdentifier: String,
                       block: ConfigurationBlock<T>!)
    func closeModule(animated: Bool)
    func present(_ viewController: UIViewController, animated flag: Bool)
}

extension TransitionHandler where Self: UIViewController {
    func openModule(segueIdentifier: String) {
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    
    func openModule<T>(segueIdentifier: String, block: ConfigurationBlock<T>!) {
        let segueInfo = SegueInfo(configurationBlock: block)
        performSegue(withIdentifier: segueIdentifier, sender: segueInfo)
    }
    
    func present(_ viewController: UIViewController, animated flag: Bool) {
        present(viewController, animated: flag, completion: nil)
    }
    
    func closeModule(animated: Bool) {
        dismiss(animated: animated, completion: nil)
    }
}
