//
//  UserInfoCell.swift
//  OkDoc
//
//  Created by workmachine on 19.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

final class UserInfoCell: UITableViewCell, XibInitializable {
	
	@IBOutlet weak var setPhotoButton: UIButton!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var title: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUIElements()
    }

	func setupUIElements() {
		setPhotoButton.setTitleColor(.scaryGray, for: .normal)
		title.font = UIFont.avertaCY(style: .Semibold, size: 18)
		title.textColor = .black
	}
	
	@IBAction func setPhoto(_ sender: UIButton) {
		
	}

}

extension UserInfoCell {
	func setup(viewModel: UserInfoViewModel) {
		title.text = viewModel.title
		if viewModel.image == "" {
			photoImageView.image = UIImage.init(named: "emptyAvatar")
		} else {
			photoImageView.image = UIImage.init(named: viewModel.image)
		}
		
	}
}
