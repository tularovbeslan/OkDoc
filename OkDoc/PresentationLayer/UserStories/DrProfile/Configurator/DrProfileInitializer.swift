//
//  DrProfileDrProfileInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 10/05/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DrProfileModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var drprofileViewController: DrProfileViewController!

    override func awakeFromNib() {

        let configurator = DrProfileModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: drprofileViewController)
    }

}
