//
//  SegmentViewModel.swift
//  OkDoc
//
//  Created by Beslan Tularov on 12.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct SegmentViewModel {
    var title: String
}

extension SegmentViewModel: CellViewModel {
    func instanceOf(cell: SegmentCell) {
        cell.setup(viewModel: self)
    }
}
