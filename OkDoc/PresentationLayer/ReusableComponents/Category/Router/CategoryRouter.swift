//
//  CategoryCategoryRouter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class CategoryRouter: CategoryRouterInput {
    var transitionHandler: TransitionHandler!
    
    func openModule() {
        transitionHandler.openModule(segueIdentifier: String.init(describing: DoctorsListViewController.self))
    }
}
