//
//  DoctorsListDoctorsListInitializer.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DoctorsListModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var doctorslistViewController: DoctorsListViewController!

    override func awakeFromNib() {

        let configurator = DoctorsListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: doctorslistViewController)
    }

}
