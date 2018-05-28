//
//  DisclosureViewModel.swift
//  OkDoc
//
//  Created by workmachine on 19.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

struct DisclosureViewModel {
	let title: String
}

extension DisclosureViewModel: CellViewModel {
	func instanceOf(cell: DisclosureCell) {
		cell.setup(viewModel: self)
	}
}
