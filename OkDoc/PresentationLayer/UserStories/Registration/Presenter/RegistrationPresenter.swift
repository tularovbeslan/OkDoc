//
//  RegistrationRegistrationPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class RegistrationPresenter: RegistrationModuleInput, RegistrationViewOutput, RegistrationInteractorOutput {

    weak var view: RegistrationViewInput!
    var interactor: RegistrationInteractorInput!
    var router: RegistrationRouterInput!

    func viewIsReady() {
		view.setupInitialState()
    }
}
