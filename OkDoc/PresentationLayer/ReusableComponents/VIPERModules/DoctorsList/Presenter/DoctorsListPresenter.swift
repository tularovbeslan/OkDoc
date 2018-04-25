//
//  DoctorsListDoctorsListPresenter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class DoctorsListPresenter: DoctorsListModuleInput, DoctorsListViewOutput, DoctorsListInteractorOutput {

    weak var view: DoctorsListViewInput!
    var interactor: DoctorsListInteractorInput!
    var router: DoctorsListRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        view.setNavigationBar(title: "Физиотерапевт")
    }
    
    func didSelect() {
        router.openModule()
    }
}
