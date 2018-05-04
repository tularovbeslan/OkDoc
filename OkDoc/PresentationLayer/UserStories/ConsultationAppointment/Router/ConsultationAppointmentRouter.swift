//
//  ConsultationAppointmentConsultationAppointmentRouter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class ConsultationAppointmentRouter: ConsultationAppointmentRouterInput {
    weak var transitionHandler: TransitionHandler!
    
    func openModule() {
        transitionHandler.openModule(segueIdentifier: String.init(describing: AnalysisSelectionViewController.self))
    }
}
