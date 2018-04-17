//
//  CategoryCategoryConfigurator.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class CategoryModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CategoryViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CategoryViewController) {

        let router = CategoryRouter()
        router.transitionHandler = viewController
        
        let presenter = CategoryPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CategoryInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
