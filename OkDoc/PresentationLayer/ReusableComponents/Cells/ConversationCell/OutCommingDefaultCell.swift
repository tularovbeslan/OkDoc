//
//  OutCommingDefaultCell.swift
//  OkDoc
//
//  Created by workmachine on 31.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RealmSwift

class OutCommingDefaultCell: ASCellNode {
	
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
			NSAttributedStringKey.foregroundColor: UIColor.black
		]
		
		message.attributedText = NSAttributedString(string: model.text, attributes: attributes)

		addSubnode(bubble)
		addSubnode(message)
	}
	
	override func didLoad() {
		bubble.clipsToBounds = true
		bubble.backgroundColor = .outCommingGray
	}
	
	override func layoutDidFinish() {
		bubble.cornerRadius = 12
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		let messageSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(10, 14, 10, 14), child: message)
		
		let bubbleSpec = ASBackgroundLayoutSpec(child: messageSpec, background: bubble)
		
		let stack = ASStackLayoutSpec.init(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [bubbleSpec])
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 20, 5, 50), child: stack)

		return stackInsetnsSpec
	}
}
