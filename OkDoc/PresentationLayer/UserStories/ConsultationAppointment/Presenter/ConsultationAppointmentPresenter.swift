//
//  ConsultationAppointmentConsultationAppointmentPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class ConsultationAppointmentPresenter: ConsultationAppointmentModuleInput, ConsultationAppointmentViewOutput, ConsultationAppointmentInteractorOutput {

    // MARK: - Properties
    weak var view: ConsultationAppointmentViewInput!
    var interactor: ConsultationAppointmentInteractorInput!
    var router: ConsultationAppointmentRouterInput!
    
    
    // MARK: - ConsultationAppointmentViewOutput
    func viewDidLoad() {
        view.setupInitialState()
        view.setTitle(text: "Регистрация")
        view.setNavigationBarBackButton(title: "")
    }

    func viewIsReady() {
        interactor.prepareAppointmentInformation()
    }
    
    func addAnalysis() {
        router.openModule()
    }
    
    // MARK: - ConsultationAppointmentInteractorOutput
    func AppointmentInformationDidPrepare(viewModel: ConsultationAppointmentViewModel) {
        view.updateView(with: viewModel)
    }
}
