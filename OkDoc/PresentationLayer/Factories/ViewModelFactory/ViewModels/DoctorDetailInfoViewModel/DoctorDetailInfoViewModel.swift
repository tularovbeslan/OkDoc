//
//  DoctorDetailInfoViewModel.swift
//  OkDoc
//
//  Created by Beslan Tularov on 13.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct DoctorDetailInfoViewModel {

}

extension DoctorDetailInfoViewModel: CellViewModel {
    func instanceOf(cell: DoctorDetailInfoCell) {
        cell.setup(viewModel: self)
    }
}
