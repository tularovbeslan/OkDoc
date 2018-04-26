//
//  ConsultationAppointmentConsultationAppointmentViewController.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationAppointmentViewController: UIViewController, ConsultationAppointmentViewInput {

    // MARK: - Properties
    var output: ConsultationAppointmentViewOutput!
    
    // MARK: - IBOutlets
    @IBOutlet weak var timeView: TimeView!
    @IBOutlet weak var dateView: DateView!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ConsultationAppointmentViewInput
    func setupInitialState() {
        timeView.times = ["12:20", "12:20", "12:20", "12:20", "12:20", "12:20", "12:20", "12:20", "12:20"]
        dateView.date = [["Пн":"12"], ["Вт":"13"], ["Ср":"14"], ["Чт":"15"], ["Пт":"16"], ["Сб":"17"]]
    }
}
