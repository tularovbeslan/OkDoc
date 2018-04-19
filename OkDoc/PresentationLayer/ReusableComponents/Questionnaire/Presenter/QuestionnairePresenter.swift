//
//  QuestionnaireQuestionnairePresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class QuestionnairePresenter: QuestionnaireModuleInput, QuestionnaireViewOutput, QuestionnaireInteractorOutput {

    weak var view: QuestionnaireViewInput!
    var interactor: QuestionnaireInteractorInput!
    var router: QuestionnaireRouterInput!

    func viewIsReady() {

    }
}
