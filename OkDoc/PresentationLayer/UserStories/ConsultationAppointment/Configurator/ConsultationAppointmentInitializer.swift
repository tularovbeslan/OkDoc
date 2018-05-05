//
//  ConsultationAppointmentConsultationAppointmentInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationAppointmentModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var consultationappointmentViewController: ConsultationAppointmentViewController!

    override func awakeFromNib() {

        let configurator = ConsultationAppointmentModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: consultationappointmentViewController)
    }

}
