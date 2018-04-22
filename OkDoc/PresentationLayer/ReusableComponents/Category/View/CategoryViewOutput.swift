//
//  CategoryCategoryViewOutput.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol CategoryViewOutput {

    /**
        @author Беслан Тулров
        Notify presenter that view is ready
    */

    func viewDidLoad()
    func viewIsReady()
    func didSelect()
}
