//
//  ProfileCommonInfoViewModel.swift
//  OkDoc
//
//  Created by Beslan Tularov on 13.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct ProfileCommonInfoViewModel {

}

extension ProfileCommonInfoViewModel: CellViewModel {
    func instanceOf(cell: ProfileCommonInfoCell) {
        cell.setup(viewModel: self)
    }
}
