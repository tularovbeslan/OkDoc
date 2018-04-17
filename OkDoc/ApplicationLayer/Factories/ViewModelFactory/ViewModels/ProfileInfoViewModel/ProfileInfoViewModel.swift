//
//  ProfileInfoViewModel.swift
//  OkDoc
//
//  Created by Beslan Tularov on 13.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct ProfileInfoViewModel {

}

extension ProfileInfoViewModel: CellViewModel {
    func instanceOf(cell: ProfileInfoCell) {
        cell.setup(viewModel: self)
    }
}
