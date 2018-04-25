//
//  DialogDialogConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DialogModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DialogViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DialogViewController) {

        let router = DialogRouter()

        let presenter = DialogPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DialogInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
