//
//  AnalysisServiceImplementation.swift
//  OkDoc
//
//  Created by workmachine on 01.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

class AnalysisServiceImplementation: AnalysisService {
    // MARK: - Properties
    var network: Network!
    
    // MARK: - AnalysisService
    func obtainAnalysis(completion: @escaping (AnalysisSelectionViewModel) -> ()) {
        network.loadAnalysis { (analysisSelectionViewModel) in
            completion(analysisSelectionViewModel)
        }
    }
}
