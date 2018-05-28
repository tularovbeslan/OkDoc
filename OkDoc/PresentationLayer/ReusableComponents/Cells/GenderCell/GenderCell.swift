//
//  GenderCell.swift
//  OkDoc
//
//  Created by workmachine on 10.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

final class GenderCell: UITableViewCell, XibInitializable {
	
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var male: UIButton!
	@IBOutlet weak var female: UIButton!
	@IBOutlet weak var verticalSpacing: NSLayoutConstraint!
	@IBOutlet weak var trailing: NSLayoutConstraint!
	
	var selectedIndex: Int = 0 {
		didSet {
			female.backgroundColor	= selectedIndex == 0 ? .freshBlue : .coldGray
			female.setTitleColor(selectedIndex == 0 ? .white : .black, for: .normal)
			male.backgroundColor	= selectedIndex == 1 ? .freshBlue : .coldGray
			male.setTitleColor(selectedIndex == 1 ? .white : .black, for: .normal)
		}
	}

    override func awakeFromNib() {
        super.awakeFromNib()
		setupButtons(buttons: [male, female])
    }
	
	func setupButtons(buttons: [UIButton]) {
		buttons.forEach { (button) in
			button.layer.cornerRadius	= 8
			button.layer.masksToBounds	= true
			button.backgroundColor		= .coldGray
		}
	}

	@IBAction func selectMale(_ sender: UIButton) {
		selectedIndex = 1
	}
	
	@IBAction func selectFeMale(_ sender: UIButton) {
		selectedIndex = 0
	}
	
}
