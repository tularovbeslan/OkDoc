//
//  CategorySelectionCategorySelectionConfigurator.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class CategorySelectionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CategorySelectionViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CategorySelectionViewController) {

        let router = CategorySelectionRouter()
        
        let feedbackEngine = FeedbackEngine()
        
        let feedbackService = FeedbackServiceImplementation()
        feedbackService.feedbackEngine = feedbackEngine

        let presenter = CategorySelectionPresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.feedbackService = feedbackService

        let interactor = CategorySelectionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
