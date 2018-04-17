//
//  DoctorsListDoctorsListRouter.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class DoctorsListRouter: DoctorsListRouterInput {
    var transitionHandler: TransitionHandler!
    
    func openModule() {
        transitionHandler.openModule(segueIdentifier: String.init(describing: ProfileViewController.self))
    }
}
