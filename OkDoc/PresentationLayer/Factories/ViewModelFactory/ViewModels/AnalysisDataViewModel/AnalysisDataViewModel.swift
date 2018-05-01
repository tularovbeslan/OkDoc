//
//  AnalysisDataViewModel.swift
//  OkDoc
//
//  Created by workmachine on 27.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit.UIImage

struct AnalysisDataViewModel {
    let image: UIImage?
    let title: String
}

extension AnalysisDataViewModel: CellViewModel {
    func instanceOf(cell: AnalysisDataCell) {
        cell.setup(viewModel: self)
    }
}
