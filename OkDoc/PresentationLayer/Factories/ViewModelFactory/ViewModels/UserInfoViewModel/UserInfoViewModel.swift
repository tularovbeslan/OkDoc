//
//  UserInfoViewModel.swift
//  OkDoc
//
//  Created by workmachine on 19.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit.UIImage

struct UserInfoViewModel {
	let title: String
	let image: String
}

extension UserInfoViewModel: CellViewModel {
	func instanceOf(cell: UserInfoCell) {
		cell.setup(viewModel: self)
	}
}
