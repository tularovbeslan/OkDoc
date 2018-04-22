//
//  CategoryViewModel.swift
//  OkDoc
//
//  Created by Beslan Tularov on 03.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    var title: String
    var subTitle: String
    var photo: String
}

extension CategoryViewModel: CellViewModel {
    func instanceOf(cell: CategoryCell) {
        cell.setup(viewModel: self)
    }
}
