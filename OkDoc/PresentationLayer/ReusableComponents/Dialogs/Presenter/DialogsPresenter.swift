//
//  DialogsDialogsPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class DialogsPresenter: DialogsModuleInput, DialogsViewOutput, DialogsInteractorOutput {

    weak var view: DialogsViewInput!
    var interactor: DialogsInteractorInput!
    var router: DialogsRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}
