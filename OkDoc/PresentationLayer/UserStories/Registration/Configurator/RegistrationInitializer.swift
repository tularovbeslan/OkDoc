//
//  RegistrationRegistrationInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class RegistrationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var registrationViewController: RegistrationViewController!

    override func awakeFromNib() {

        let configurator = RegistrationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: registrationViewController)
    }

}
