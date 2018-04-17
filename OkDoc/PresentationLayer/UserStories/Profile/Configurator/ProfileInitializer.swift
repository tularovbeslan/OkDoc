//
//  ProfileProfileInitializer.swift
//  OkDoc
//
//  Created by Беслан Тулров on 03/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ProfileModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var profileViewController: ProfileViewController!

    override func awakeFromNib() {

        let configurator = ProfileModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: profileViewController)
    }

}
