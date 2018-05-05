//
//  CategoryCategoryInitializer.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class CategoryModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var categoryViewController: CategoryViewController!

    override func awakeFromNib() {

        let configurator = CategoryModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: categoryViewController)
    }

}
