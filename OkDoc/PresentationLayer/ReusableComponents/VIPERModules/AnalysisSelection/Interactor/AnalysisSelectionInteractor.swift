//
//  AnalysisSelectionAnalysisSelectionInteractor.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

class AnalysisSelectionInteractor: AnalysisSelectionInteractorInput {

    // MARK: - Properties
    weak var output: AnalysisSelectionInteractorOutput!
    var service: AnalysisService!

    // MARK: - AnalysisSelectionInteractorInput
    func prepareAnalysis() {
        let testNames = ["Антистрептолизин О","Ревматоидный фактор","Эозинофильный катионный белок","Церулоплазмин","Альфа1-антитрипсин","С-реактивный белок ультрачувит","Амилаза панкреатическая", "Креатинкиназа-МВ", "Холинэстераза"]
        var viewModels: [AnalysisSelectionViewModel] = []
        for name in testNames {
            let model = AnalysisSelectionViewModel.init(name: name)
            viewModels.append(model)
            output.analysisDidPrepare(by: viewModels)
        }
    }
}
