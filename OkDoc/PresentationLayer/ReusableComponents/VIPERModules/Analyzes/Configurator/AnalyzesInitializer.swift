//
//  AnalyzesAnalyzesInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AnalyzesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var analyzesViewController: AnalyzesViewController!

    override func awakeFromNib() {

        let configurator = AnalyzesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: analyzesViewController)
    }

}
