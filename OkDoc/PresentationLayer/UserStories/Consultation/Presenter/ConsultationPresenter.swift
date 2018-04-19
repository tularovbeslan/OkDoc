//
//  ConsultationConsultationPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class ConsultationPresenter: ConsultationModuleInput, ConsultationViewOutput, ConsultationInteractorOutput {

    weak var view: ConsultationViewInput!
    var interactor: ConsultationInteractorInput!
    var router: ConsultationRouterInput!

    func viewIsReady() {

    }
}
