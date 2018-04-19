//
//  AppointmentInfoAppointmentInfoViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class AppointmentInfoViewController: UIViewController, AppointmentInfoViewInput {

    var output: AppointmentInfoViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AppointmentInfoViewInput
    func setupInitialState() {
    }
}
