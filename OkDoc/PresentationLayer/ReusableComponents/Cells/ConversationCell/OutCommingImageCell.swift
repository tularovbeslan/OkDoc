//
//  OutCommingImageCell.swift
//  OkDoc
//
//  Created by workmachine on 02.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RealmSwift

class OutCommingImageCell: ASCellNode {
	var imageNode: ASImageNode
	
	init(model: Message) {
		imageNode = ASImageNode()
		
		super.init()
				guard let data = model.imageData else { return }
		selectionStyle = .none
		imageNode.image = UIImage(data: data)
		imageNode.cornerRadius = 12
		imageNode.contentMode = .scaleAspectFill
		
		addSubnode(imageNode)
	}
	
	override func layoutDidFinish() {
		imageNode.addTarget(self, action: #selector(handleZoomTap), forControlEvents: ASControlNodeEvent.touchUpInside)
	}
	
	var startingFrame: CGRect!
	var overlay: UIView!
	
	@objc private func handleZoomTap() {
		startingFrame = imageNode.view.superview!.convert(imageNode.frame, to: nil)
		let zoomingImageView = UIImageView.init(frame: startingFrame)
		zoomingImageView.backgroundColor = .red
		zoomingImageView.image = imageNode.image
		zoomingImageView.layer.cornerRadius = 12
		zoomingImageView.layer.masksToBounds = true
		zoomingImageView.isUserInteractionEnabled = true
		zoomingImageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(zoomingOut)))
		
		if let keyWindow = UIApplication.shared.keyWindow {
			overlay = UIView.init(frame: keyWindow.frame)
			overlay.backgroundColor = .black
			overlay.alpha = 0
			keyWindow.addSubview(overlay)
			keyWindow.addSubview(zoomingImageView)
			imageNode.isHidden = true
			UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
				zoomingImageView.layer.cornerRadius = 0
				self.overlay.alpha = 1
				let height = self.startingFrame.height / self.startingFrame.width * keyWindow.frame.width
				zoomingImageView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
				zoomingImageView.center = keyWindow.center
			}, completion: nil)
		}
	}
	
	@objc private func zoomingOut(tapGesture: UITapGestureRecognizer) {
		if let zoomOutImageView = tapGesture.view {
			UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
				zoomOutImageView.frame = self.startingFrame
				zoomOutImageView.layer.cornerRadius = 12
				self.overlay.alpha = 0
			}) { (complated) in
				zoomOutImageView.removeFromSuperview()
				self.imageNode.isHidden = false
			}
		}
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		let origunalWidth = imageNode.image!.size.width
		let origunalHeight = imageNode.image!.size.height
		let ration = (origunalHeight / origunalWidth)
		
		imageNode.style.preferredSize = imageNode.image!.size
		
		let rationSpec = ASRatioLayoutSpec(ratio: ration, child: imageNode)
		
		let stackSpec = ASStackLayoutSpec.init(direction: .vertical, spacing: 0, justifyContent: .end, alignItems: .end, children: [rationSpec])
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 20, 5, 100), child: stackSpec)
		
		return stackInsetnsSpec
	}
}
