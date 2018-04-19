//
//  ConsultationConsultationViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationViewController: UIViewController, ConsultationViewInput {

    var output: ConsultationViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ConsultationViewInput
    func setupInitialState() {
    }
}
