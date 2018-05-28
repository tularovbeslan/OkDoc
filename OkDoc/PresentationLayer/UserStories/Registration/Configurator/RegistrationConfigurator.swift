//
//  RegistrationRegistrationConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class RegistrationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RegistrationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RegistrationViewController) {

        let router = RegistrationRouter()

        let presenter = RegistrationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RegistrationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
