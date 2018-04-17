//
//  DoctorsListDoctorsListConfigurator.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DoctorsListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DoctorsListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DoctorsListViewController) {

        let router = DoctorsListRouter()
        router.transitionHandler = viewController

        let presenter = DoctorsListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DoctorsListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
