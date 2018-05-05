//
//  DateViewModel.swift
//  OkDoc
//
//  Created by workmachine on 26.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct DateViewModel {
    let weekDay: String
    let date: String
}

extension DateViewModel: CellViewModel {
    func instanceOf(cell: DateCell) {
        cell.setup(viewModel: self)
    }
}
