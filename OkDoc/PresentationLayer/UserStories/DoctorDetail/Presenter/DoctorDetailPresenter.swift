//
//  DoctorDetailPresenter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class DoctorDetailPresenter: DoctorDetailModuleInput, DoctorDetailViewOutput, DoctorDetailInteractorOutput {

    weak var view: DoctorDetailViewInput!
    var interactor: DoctorDetailInteractorInput!
    var router: DoctorDetailRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        view.setNavigationBarBackButton(title: "")
    }
    
    func oppointmentDidPress() {
        router.openModule()
    }
}
