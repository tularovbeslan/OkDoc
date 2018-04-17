//
//  UIImageExtension.swift
//  OmniPharm
//
//  Created by Beslan Tularov on 11.03.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
extension UIImage {
    class func image(with color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
