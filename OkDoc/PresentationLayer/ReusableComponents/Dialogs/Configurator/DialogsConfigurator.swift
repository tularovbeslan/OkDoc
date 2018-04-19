//
//  DialogsDialogsConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DialogsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DialogsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DialogsViewController) {

        let router = DialogsRouter()

        let presenter = DialogsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DialogsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
