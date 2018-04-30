//
//  AnalysisSelectionAnalysisSelectionConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AnalysisSelectionModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AnalysisSelectionViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AnalysisSelectionViewController) {

        let router = AnalysisSelectionRouter()

        let presenter = AnalysisSelectionPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AnalysisSelectionInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
