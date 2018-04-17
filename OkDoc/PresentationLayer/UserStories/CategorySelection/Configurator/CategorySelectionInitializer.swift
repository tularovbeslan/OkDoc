//
//  CategorySelectionCategorySelectionInitializer.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class CategorySelectionModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var categoryselectionViewController: CategorySelectionViewController!

    override func awakeFromNib() {

        let configurator = CategorySelectionModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: categoryselectionViewController)
    }

}
