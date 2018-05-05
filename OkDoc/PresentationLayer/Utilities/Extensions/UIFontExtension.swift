//
//  UIFontExtension.swift
//  OkDoc
//
//  Created by workmachine on 01.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit

extension UIFont {
    static func avertaCY(size: CGFloat) -> UIFont {
        let font = UIFont(name: "AvertaCY-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
        return font
    }
}
