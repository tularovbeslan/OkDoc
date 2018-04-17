//
//  CategorySelectionCategorySelectionPresenter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class CategorySelectionPresenter: CategorySelectionModuleInput, CategorySelectionViewOutput, CategorySelectionInteractorOutput {

    weak var view: CategorySelectionViewInput!
    var interactor: CategorySelectionInteractorInput!
    var router: CategorySelectionRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        view.navigationBarBackButton(title: "")
    }
}
