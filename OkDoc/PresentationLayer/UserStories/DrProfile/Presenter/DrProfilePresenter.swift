//
//  DrProfileDrProfilePresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class DrProfilePresenter: DrProfileModuleInput, DrProfileViewOutput, DrProfileInteractorOutput {

    weak var view: DrProfileViewInput!
    var interactor: DrProfileInteractorInput!
    var router: DrProfileRouterInput!

    func viewIsReady() {
		view.setupInitialState()
    }
}
