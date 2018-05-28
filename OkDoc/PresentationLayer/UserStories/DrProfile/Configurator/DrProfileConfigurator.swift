//
//  DrProfileDrProfileConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DrProfileModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DrProfileViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DrProfileViewController) {

        let router = DrProfileRouter()

        let presenter = DrProfilePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DrProfileInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
