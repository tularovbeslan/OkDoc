//
//  AnalyzesAnalyzesPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 19/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class AnalyzesPresenter: AnalyzesModuleInput, AnalyzesViewOutput, AnalyzesInteractorOutput {

    weak var view: AnalyzesViewInput!
    var interactor: AnalyzesInteractorInput!
    var router: AnalyzesRouterInput!

    func viewIsReady() {

    }
}
