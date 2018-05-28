//
//  ExitCell.swift
//  OkDoc
//
//  Created by workmachine on 19.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

final class ExitCell: UITableViewCell, XibInitializable {
	
	@IBOutlet weak var button: UIButton!
	
	public var exit: () -> () = { }
	
	public var mode: UIControlContentHorizontalAlignment = .center {
		didSet {
			button.contentHorizontalAlignment = mode
		}
	}
	
	public var titleColor: UIColor = .red {
		didSet {
			button.setTitleColor(titleColor, for: .normal)
		}
	}
	
	public var title: String = "" {
		didSet {
			button.setTitle(title, for: .normal)
		}
	}
	
	@IBAction func exit(_ sender: UIButton) {
		exit()
	}
}

