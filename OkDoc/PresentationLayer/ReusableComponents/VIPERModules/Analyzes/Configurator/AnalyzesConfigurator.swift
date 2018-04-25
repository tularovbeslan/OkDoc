//
//  AnalyzesAnalyzesConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AnalyzesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AnalyzesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AnalyzesViewController) {

        let router = AnalyzesRouter()

        let presenter = AnalyzesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AnalyzesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
