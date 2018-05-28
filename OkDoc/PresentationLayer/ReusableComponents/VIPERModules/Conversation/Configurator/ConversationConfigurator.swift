//
//  ConversationConversationConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 27/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConversationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ConversationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ConversationViewController) {

        let router = ConversationRouter()

        let presenter = ConversationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ConversationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
