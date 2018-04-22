//
//  CategoryCategoryPresenter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class CategoryPresenter: CategoryModuleInput, CategoryViewOutput, CategoryInteractorOutput {

    // MARK: - Properties
    weak var view: CategoryViewInput!
    var interactor: CategoryInteractorInput!
    var router: CategoryRouterInput!
    
    //MARK: - CategoryViewOutput
    func viewDidLoad() {
        view.setupInitialState()
    }

    func viewIsReady() {
        interactor.prepareCategories()
    }
    
    func didSelect() {
        router.openModule()
    }
    
    //MARK: - CategoryInteractorOutput
    func categoriesDidPrepare(by viewModels: [CategoryViewModel]) {
        view.updateView(with: viewModels)
    }
}
