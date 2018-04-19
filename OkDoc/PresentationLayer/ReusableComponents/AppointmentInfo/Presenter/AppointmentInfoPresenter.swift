//
//  AppointmentInfoAppointmentInfoPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class AppointmentInfoPresenter: AppointmentInfoModuleInput, AppointmentInfoViewOutput, AppointmentInfoInteractorOutput {

    weak var view: AppointmentInfoViewInput!
    var interactor: AppointmentInfoInteractorInput!
    var router: AppointmentInfoRouterInput!

    func viewIsReady() {

    }
}
