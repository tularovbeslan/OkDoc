//
//  InCommingImageCell.swift
//  OkDoc
//
//  Created by workmachine on 01.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class InCommingImageCell: ASCellNode {
	var imageNode: ASImageNode
	
	init(model: Message) {
		imageNode = ASImageNode()
		
		super.init()
		selectionStyle = .none
		
		imageNode.cornerRadius = 12
		imageNode.contentMode = .scaleAspectFill
		
		addSubnode(imageNode)
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		let origunalWidth = imageNode.image!.size.width
		let origunalHeight = imageNode.image!.size.height
		let ration = (origunalHeight / origunalWidth)
		
		imageNode.style.preferredSize = imageNode.image!.size
		
		let rationSpec = ASRatioLayoutSpec(ratio: ration, child: imageNode)
		
		let stackSpec = ASStackLayoutSpec.init(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [rationSpec])
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 20, 5, 50), child: stackSpec)
		
		return stackInsetnsSpec
	}
}
