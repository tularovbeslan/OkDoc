//
//  ConsultationAppointmentConsultationAppointmentViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationAppointmentViewController: UIViewController, ConsultationAppointmentViewInput {

    var output: ConsultationAppointmentViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ConsultationAppointmentViewInput
    func setupInitialState() {
    }
}
