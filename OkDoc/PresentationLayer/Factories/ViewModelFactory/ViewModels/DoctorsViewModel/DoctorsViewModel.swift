//
//  DoctorsViewModel.swift
//  OkDoc
//
//  Created by Beslan Tularov on 11.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct DoctorsViewModel {
    var title: String
    var experience: Int
    var price: Int
    var language: String
    var photo: String
}

extension DoctorsViewModel: CellViewModel {
    func instanceOf(cell: DoctorInfoCell) {
        cell.setup(viewModel: self)
    }
}
