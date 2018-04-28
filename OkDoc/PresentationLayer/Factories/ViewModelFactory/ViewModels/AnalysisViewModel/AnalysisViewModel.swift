//
//  AnalysisViewModel.swift
//  OkDoc
//
//  Created by workmachine on 27.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct AnalysisViewModel {
    let viewModels: [AnalysisDataViewModel]
}

extension AnalysisViewModel: CellViewModel {
    func instanceOf(cell: AnalysisCell) {
        cell.setup(viewModel: self)
    }
}
