//
//  DialogDialogInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class DialogModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var dialogViewController: DialogViewController!

    override func awakeFromNib() {

        let configurator = DialogModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: dialogViewController)
    }

}
