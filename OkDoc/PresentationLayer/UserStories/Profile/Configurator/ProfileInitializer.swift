//
//  ProfileProfileInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 02/05/2018.
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
