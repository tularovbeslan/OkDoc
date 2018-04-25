//
//  AppointmentInfoAppointmentInfoConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AppointmentInfoModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AppointmentInfoViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AppointmentInfoViewController) {

        let router = AppointmentInfoRouter()

        let presenter = AppointmentInfoPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AppointmentInfoInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
