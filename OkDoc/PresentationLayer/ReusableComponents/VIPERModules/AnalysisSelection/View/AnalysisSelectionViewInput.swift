//
//  AnalysisSelectionAnalysisSelectionViewInput.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol AnalysisSelectionViewInput: class {

    /**
        @author Beslan Tularov
        Setup initial state of the view
    */

    func setupInitialState()
    func setNavigationBar(title: String)
    func updateView(with viewModels: [AnalysisSelectionViewModel])
}
