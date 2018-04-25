//
//  CategoryCategoryInteractor.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class CategoryInteractor: CategoryInteractorInput {

    weak var output: CategoryInteractorOutput!
    var service: CategoriesService!

    func prepareCategories() {
        service.obtainCategories { [weak self] (viewModels) in
            self?.output.categoriesDidPrepare(by: viewModels)
        }
    }
}
