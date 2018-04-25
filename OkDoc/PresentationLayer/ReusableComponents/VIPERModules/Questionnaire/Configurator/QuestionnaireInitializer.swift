//
//  QuestionnaireQuestionnaireInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class QuestionnaireModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var questionnaireViewController: QuestionnaireViewController!

    override func awakeFromNib() {

        let configurator = QuestionnaireModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: questionnaireViewController)
    }

}
