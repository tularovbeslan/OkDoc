//
//  AnalysisSelectionAnalysisSelectionPresenter.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class AnalysisSelectionPresenter: AnalysisSelectionModuleInput, AnalysisSelectionViewOutput, AnalysisSelectionInteractorOutput {

    // MARK: - Properties
    weak var view: AnalysisSelectionViewInput!
    var interactor: AnalysisSelectionInteractorInput!
    var router: AnalysisSelectionRouterInput!
    
    // MARK: - AnalysisSelectionViewOutput
    func viewDidLoad() {
        view.setupInitialState()
        view.setNavigationBar(title: "Анализы")
    }

    func viewIsReady() {
        interactor.prepareAnalysis()
    }
    
    func selectAnalysis(text: String) {
        router.showActionSheet(text: text)
    }
    
    // MAKR: - AnalysisSelectionInteractorOutput
    func analysisDidPrepare(by viewModels: [AnalysisSelectionViewModel]) {
        view.updateView(with: viewModels)
    }
}
