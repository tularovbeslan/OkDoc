//
//  ConsultationConsultationViewInput.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol ConsultationViewInput: class {

    /**
        @author Beslan Tularov
        Setup initial state of the view
    */

    func setupInitialState()
    func setTitleLabel(text: String)
    func setNavigationBarBackButton(title: String)
}
