//
//  DisclosureCell.swift
//  OkDoc
//
//  Created by workmachine on 19.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

final class DisclosureCell: UITableViewCell, XibInitializable {
	
	@IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension DisclosureCell {
	func setup(viewModel: DisclosureViewModel) {
		title.text = viewModel.title
	}
}
