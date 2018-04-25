//
//  QuestionnaireQuestionnaireConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class QuestionnaireModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? QuestionnaireViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: QuestionnaireViewController) {

        let router = QuestionnaireRouter()

        let presenter = QuestionnairePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = QuestionnaireInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
