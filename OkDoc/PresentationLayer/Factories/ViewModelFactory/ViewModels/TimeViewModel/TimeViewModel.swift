//
//  TimeViewModel.swift
//  OkDoc
//
//  Created by workmachine on 23.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct TimeViewModel {
    let time: String
}

extension TimeViewModel: CellViewModel {
    func instanceOf(cell: TimeCell) {
        cell.setup(viewModel: self)
    }
}
