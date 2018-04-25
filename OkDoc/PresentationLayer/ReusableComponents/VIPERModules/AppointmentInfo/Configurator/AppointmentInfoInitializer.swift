//
//  AppointmentInfoAppointmentInfoInitializer.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AppointmentInfoModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var appointmentinfoViewController: AppointmentInfoViewController!

    override func awakeFromNib() {

        let configurator = AppointmentInfoModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: appointmentinfoViewController)
    }

}
