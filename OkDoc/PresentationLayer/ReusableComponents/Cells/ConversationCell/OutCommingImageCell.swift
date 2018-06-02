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
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		let origunalWidth = imageNode.image!.size.width
		let origunalHeight = imageNode.image!.size.height
		let ration = (origunalHeight / origunalWidth)
		
		imageNode.style.preferredSize = imageNode.image!.size
		
		let rationSpec = ASRatioLayoutSpec(ratio: ration, child: imageNode)
		
		let stackSpec = ASStackLayoutSpec.init(direction: .vertical, spacing: 0, justifyContent: .end, alignItems: .end, children: [rationSpec])
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 20, 5, 50), child: stackSpec)
		
		return stackInsetnsSpec
	}
}
