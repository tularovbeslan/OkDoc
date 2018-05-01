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
        router.transitionHandler = viewController
        
        let network = NetworkImplementation()
        
        let service = AnalysisServiceImplementation()
        service.network = network

        let presenter = AnalysisSelectionPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AnalysisSelectionInteractor()
        interactor.output = presenter
        interactor.service = service

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
