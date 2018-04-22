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

        let router = CategoryRouter.init()
        router.transitionHandler = viewController
        
        let network = NetworkImplementation.init()
        
        let service = CategoriesServiceImplementation.init()
        service.network = network
        
        let presenter = CategoryPresenter.init()
        presenter.view = viewController
        presenter.router = router

        let interactor = CategoryInteractor.init()
        interactor.output = presenter
        interactor.service = service

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
