//
//  ConsultationAppointmentConsultationAppointmentViewInput.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol ConsultationAppointmentViewInput: class {

    /**
        @author Beslan Tularov
        Setup initial state of the view
    */

    func setupInitialState()
    func setTitle(text: String)
    func setNavigationBarBackButton(title: String)
    func updateView(with viewModel: ConsultationAppointmentViewModel)
}
