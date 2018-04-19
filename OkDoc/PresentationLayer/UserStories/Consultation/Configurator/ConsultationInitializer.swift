//
//  ConsultationConsultationInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var consultationViewController: ConsultationViewController!

    override func awakeFromNib() {

        let configurator = ConsultationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: consultationViewController)
    }

}
