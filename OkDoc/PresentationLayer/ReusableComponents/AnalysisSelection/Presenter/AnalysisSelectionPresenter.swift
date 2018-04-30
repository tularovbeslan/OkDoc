//
//  AnalysisSelectionAnalysisSelectionPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class AnalysisSelectionPresenter: AnalysisSelectionModuleInput, AnalysisSelectionViewOutput, AnalysisSelectionInteractorOutput {

    weak var view: AnalysisSelectionViewInput!
    var interactor: AnalysisSelectionInteractorInput!
    var router: AnalysisSelectionRouterInput!

    func viewIsReady() {

    }
}
