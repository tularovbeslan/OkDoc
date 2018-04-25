//
//  DialogsDialogsInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DialogsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var dialogsViewController: DialogsViewController!

    override func awakeFromNib() {

        let configurator = DialogsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: dialogsViewController)
    }

}
