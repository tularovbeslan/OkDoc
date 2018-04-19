//
//  DoctorDetailConfigurator.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DoctorDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DoctorDetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DoctorDetailViewController) {

        let router = DoctorDetailRouter()

        let presenter = DoctorDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DoctorDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
