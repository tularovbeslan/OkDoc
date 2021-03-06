//
//  AnalysisSelectionAnalysisSelectionViewOutput.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

protocol AnalysisSelectionViewOutput {

    /**
        @author Beslan Tularov
        Notify presenter that view is ready
    */

    func viewDidLoad()
    func viewIsReady()
    func selectAnalysis(text: String)
}
