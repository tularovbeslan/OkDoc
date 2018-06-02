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
 
	func resizeImage(_ image: UIImage, size: CGSize) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
		image.draw(in: CGRect(origin: CGPoint.zero, size: size))
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return resizedImage!
	}
	
	func data() -> Data {
		var imageData = UIImagePNGRepresentation(self)
		// Resize the image if it exceeds the 2MB API limit
		if (imageData?.count)! > 2097152 {
			let oldSize = self.size
			let newSize = CGSize(width: 800, height: oldSize.height / oldSize.width * 800)
			let newImage = self.resizeImage(self, size: newSize)
			imageData = UIImageJPEGRepresentation(newImage, 0.7)
		}
		return imageData!
	}
	
	func base64EncodedString() -> String {
		let imageData = self.data()
		let stringData = imageData.base64EncodedString(options: .endLineWithCarriageReturn)
		return stringData
	}
}
