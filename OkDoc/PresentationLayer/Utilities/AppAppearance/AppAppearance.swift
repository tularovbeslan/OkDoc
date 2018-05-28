//
//  AppAppearance.swift
//  OkDoc
//
//  Created by workmachine on 23.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

extension UIColor {
	static let coldGray:	UIColor = UIColor.init(red: 241/255, green: 242/255, blue: 245/255, alpha: 1)
	static let sweetGray: UIColor = UIColor(red: 197/255, green: 211/255, blue: 228/255, alpha: 1)
	static let freshBlue:	UIColor = UIColor.init(red: 2/255, green: 123/255, blue: 255/255, alpha: 1)
	static let scaryGray:	UIColor = UIColor.init(red: 133/255, green: 147/255, blue: 164/255, alpha: 1)
	static let purple:		UIColor = UIColor(red:125/255.0, green:76/255.0, blue:245/255.0, alpha: 1)
	static let darkPurple:	UIColor = UIColor(red: 125/255, green: 76/255, blue: 245/255, alpha: 1)
	static let lightPurple: UIColor = UIColor(red: 156/255, green: 141/255, blue: 255/255, alpha: 1)
	

}

extension UIFont {
	static func avertaCY(style: FontStyle, size: CGFloat) -> UIFont {
		let fontStyle = style.rawValue
		let font = UIFont(name: "AvertaCY-\(fontStyle)", size: size) ?? UIFont.systemFont(ofSize: size)
		return font
	}
	
	enum FontStyle: String {
		case Regular
		case Semibold
		case Bold
	}
}

