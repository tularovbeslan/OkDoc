//
//  OutCommingVideoCell.swift
//  OkDoc
//
//  Created by workmachine on 03.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RealmSwift

class OutCommingVideoCell: ASCellNode {
	var videoNode: ASVideoNode
	
	init(model: Message) {
		videoNode = ASVideoNode()
		
		super.init()
		let url = FileStorageManager.urlFrom(directory: .Videos, and: model.videoURL)
		selectionStyle = .none
		
		DispatchQueue.main.async {
			let asset = AVAsset.init(url: url)
			self.videoNode.asset = asset
		}
		videoNode.cornerRadius = 12
		videoNode.shouldAutoplay = true
		videoNode.gravity = AVLayerVideoGravity.resizeAspectFill.rawValue
		videoNode.backgroundColor = .black
		addSubnode(videoNode)
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let fullWidth = UIScreen.main.bounds.width
		let width = fullWidth
		let height = fullWidth * 9 / 16

		videoNode.style.width = ASDimension.init(unit: .points, value: width)
		videoNode.style.height = ASDimension.init(unit: .points, value: height)
		
		let stackSpec = ASStackLayoutSpec.init(direction: .vertical, spacing: 0, justifyContent: .end, alignItems: .end, children: [videoNode])
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 10, 5, 10), child: stackSpec)
		
		return stackInsetnsSpec
	}
}
