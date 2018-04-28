//
//  AnalysisDataViewModel.swift
//  OkDoc
//
//  Created by workmachine on 27.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation
struct AnalysisDataViewModel {
    let image: String
    let title: String
}

extension AnalysisDataViewModel: CellViewModel {
    func instanceOf(cell: AnalysisDataCell) {
        cell.setup(viewModel: self)
    }
}
