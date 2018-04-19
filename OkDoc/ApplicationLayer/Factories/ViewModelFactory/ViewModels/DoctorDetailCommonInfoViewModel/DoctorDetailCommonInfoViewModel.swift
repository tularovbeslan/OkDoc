//
//  DoctorDetailCommonInfoViewModel.swift
//  OkDoc
//
//  Created by Beslan Tularov on 13.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct DoctorDetailCommonInfoViewModel {

}

extension DoctorDetailCommonInfoViewModel: CellViewModel {
    func instanceOf(cell: DoctorDetailCommonInfoCell) {
        cell.setup(viewModel: self)
    }
}
