//
//  FormViewModel.swift
//  OkDoc
//
//  Created by workmachine on 02.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct FormViewModel {
    let title: String
    let text: String
}

extension FormViewModel: CellViewModel {
    func instanceOf(cell: FormCell) {
        cell.setup(viewModel: self)
    }
}
