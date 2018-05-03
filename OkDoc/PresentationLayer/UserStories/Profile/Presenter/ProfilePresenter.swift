//
//  ProfileProfilePresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 02/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class ProfilePresenter: ProfileModuleInput, ProfileViewOutput, ProfileInteractorOutput {

    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    var router: ProfileRouterInput!
    
    // MARK: - ProfileViewOutput
    func viewDidLoad() {
        view.setupInitialState()
        view.setTitle(text: "Профиль")
    }

    func viewIsReady() {

    }
}
