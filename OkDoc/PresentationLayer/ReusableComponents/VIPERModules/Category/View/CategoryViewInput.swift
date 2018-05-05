//
//  CategoryCategoryViewInput.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol CategoryViewInput: class {
    func setupInitialState()
    func updateView(with viewModels: [CategoryViewModel])
}
