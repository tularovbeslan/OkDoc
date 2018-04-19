//
//  ConsultationConsultationConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ConsultationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ConsultationViewController) {

        let router = ConsultationRouter()

        let presenter = ConsultationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ConsultationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
