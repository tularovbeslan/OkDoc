//
//  StateableCell.swift
//  OkDoc
//
//  Created by workmachine on 19.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

final class StateableCell: UITableViewCell, XibInitializable {
	
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var state: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension StateableCell {
	func setup(viewModel: StateableViewModel) {
		title.text = viewModel.title
		state.text = viewModel.state
	}
}
