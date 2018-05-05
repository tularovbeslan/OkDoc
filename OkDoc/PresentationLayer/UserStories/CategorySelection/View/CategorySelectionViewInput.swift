//
//  CategorySelectionCategorySelectionViewInput.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol CategorySelectionViewInput: class {

    /**
        @author Беслан Тулров
        Setup initial state of the view
    */

    func setupInitialState()
    func setTitleLabel(text: String)
    func setNavigationBarBackButton(title: String)
}
