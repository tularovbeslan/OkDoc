//
//  DoctorDetailInitializer.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DoctorDetailModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var doctorDetailViewController: DoctorDetailViewController!

    override func awakeFromNib() {

        let configurator = DoctorDetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: doctorDetailViewController)
    }

}
