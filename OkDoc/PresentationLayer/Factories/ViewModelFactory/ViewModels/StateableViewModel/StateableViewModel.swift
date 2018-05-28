//
//  StateableViewModel.swift
//  OkDoc
//
//  Created by workmachine on 19.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct StateableViewModel {
	let title: String
	let state: String
}

extension StateableViewModel: CellViewModel {
	func instanceOf(cell: StateableCell) {
		cell.setup(viewModel: self)
	}
}
