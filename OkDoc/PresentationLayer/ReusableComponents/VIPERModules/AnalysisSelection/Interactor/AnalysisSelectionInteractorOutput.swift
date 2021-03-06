//
//  AnalysisSelectionAnalysisSelectionInteractorOutput.swift
//  OkDoc
//
//  Created by Beslan Tularov on 30/04/2018.
//  Copyright © 2018 BTR. All rights reserved.
//

import Foundation

protocol AnalysisSelectionInteractorOutput: class {
    func analysisDidPrepare(by viewModels: [AnalysisSelectionViewModel])
}
