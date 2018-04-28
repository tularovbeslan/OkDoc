//
//  ConsultationAppointmentConsultationAppointmentConfigurator.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import UIKit

class ConsultationAppointmentModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ConsultationAppointmentViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ConsultationAppointmentViewController) {

        let router = ConsultationAppointmentRouter()
        
        let network = NetworkImplementation()
        
        let service = AppointmentServiceImplementation()
        service.network = network

        let presenter = ConsultationAppointmentPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ConsultationAppointmentInteractor()
        interactor.output = presenter
        interactor.service = service

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
