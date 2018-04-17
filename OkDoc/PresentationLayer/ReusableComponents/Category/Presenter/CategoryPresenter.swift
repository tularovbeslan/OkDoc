//
//  CategoryCategoryPresenter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class CategoryPresenter: CategoryModuleInput, CategoryViewOutput, CategoryInteractorOutput {

    weak var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
    var router: CategoryRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func didSelect() {
        router.openModule()
    }
}
