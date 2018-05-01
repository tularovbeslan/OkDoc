//
//  AnalysisService.swift
//  OkDoc
//
//  Created by workmachine on 01.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

protocol AnalysisService {
    func obtainAnalysis(completion: @escaping (AnalysisSelectionViewModel)->())
}
