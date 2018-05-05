//
//  DialogsViewModel.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct DialogsViewModel {
    let name: String
    let profession: String
    let date: String
    let photo: String
}

extension DialogsViewModel: CellViewModel {
    func instanceOf(cell: DialogsCell) {
        cell.setup(viewModel: self)
    }
}
