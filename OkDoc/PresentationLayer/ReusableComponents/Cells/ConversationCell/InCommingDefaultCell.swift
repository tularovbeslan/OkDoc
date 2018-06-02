//
//  InCommingDefaultCell.swift
//  OkDoc
//
//  Created by workmachine on 01.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RealmSwift

class InCommingDefaultCell: ASCellNode {
	fileprivate var message: ASTextNode
	fileprivate var bubble: ASDisplayNode
	
	init(model: Message) {
		message = ASTextNode()
		bubble = ASDisplayNode()
		
		super.init()
		
		selectionStyle = .none
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5.0
		
		let attributes = [
			NSAttributedStringKey.font: UIFont.avertaCY(style: .Regular, size: 16),
			NSAttributedStringKey.paragraphStyle: paragraphStyle,
			NSAttributedStringKey.foregroundColor: UIColor.white
		]

		message.attributedText = NSAttributedString(string: model.text, attributes: attributes)
		
		bubble.cornerRadius = 12
		bubble.clipsToBounds = true
		bubble.backgroundColor = .inCommingBlue
		
		addSubnode(bubble)
		addSubnode(message)
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let messageSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(10, 14, 10, 14), child: message)
		
		let bubbleSpec = ASBackgroundLayoutSpec(child: messageSpec, background: bubble)
		
		let stack = ASStackLayoutSpec.init(direction: .vertical, spacing: 0, justifyContent: .end, alignItems: .end, children: [bubbleSpec])
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 50, 5, 20), child: stack)
		
		return stackInsetnsSpec
	}
}
