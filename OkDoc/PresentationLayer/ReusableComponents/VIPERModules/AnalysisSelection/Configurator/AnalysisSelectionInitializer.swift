//
//  AnalysisSelectionAnalysisSelectionInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AnalysisSelectionModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var analysisselectionViewController: AnalysisSelectionViewController!

    override func awakeFromNib() {

        let configurator = AnalysisSelectionModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: analysisselectionViewController)
    }

}
