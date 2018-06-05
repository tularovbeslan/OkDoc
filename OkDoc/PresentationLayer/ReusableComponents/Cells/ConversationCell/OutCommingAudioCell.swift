//
//  OutCommingAudioCell.swift
//  OkDoc
//
//  Created by workmachine on 04.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RealmSwift
import SoundWave
import SnapKit

class OutCommingAudioCell: ASCellNode {
	fileprivate var bubble: ASDisplayNode
	fileprivate var button: ASButtonNode
	fileprivate var time: ASTextNode
	fileprivate var wave: ASDisplayNode
	
	init(model: Message) {
		bubble		= ASDisplayNode()
		button		= ASButtonNode()
		time		= ASTextNode()
		wave		= ASDisplayNode()
		
		super.init()

		selectionStyle = .none
		
		button.setImage(#imageLiteral(resourceName: "playInComming"), for: .normal)
		button.addTarget(self, action: #selector(play), forControlEvents: ASControlNodeEvent.touchUpInside)
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5.0
		
		let attributes = [
			NSAttributedStringKey.font: UIFont.avertaCY(style: .Semibold, size: 11),
			NSAttributedStringKey.paragraphStyle: paragraphStyle,
			NSAttributedStringKey.foregroundColor: UIColor.black
		]
		
		time.attributedText = NSAttributedString(string: "1:00", attributes: attributes)
		
		addSubnode(bubble)
		addSubnode(button)
		addSubnode(time)
		addSubnode(wave)
	}
	
	override func didLoad() {
		bubble.clipsToBounds = true
		bubble.backgroundColor = .outCommingGray
		wave.backgroundColor = .blue
	}
	
	override func layoutDidFinish() {
		bubble.cornerRadius = 22
		
		let audioVisualizationView = AudioVisualizationView(frame: wave.view.bounds)
		audioVisualizationView.meteringLevels = [0.1, 0.67, 0.13, 0.78, 0.31, 0.1, 0.67, 0.13, 0.78, 0.31, 0.1, 0.67, 0.13, 0.78, 0.31, 0.1, 0.67, 0.13, 0.78, 0.31, 0.1, 0.67, 0.13, 0.78, 0.31, 0.1, 0.67, 0.13, 0.78, 0.31, 0.1, 0.67, 0.13, 0.78, 0.31]
		audioVisualizationView.backgroundColor = UIColor.outCommingGray
		audioVisualizationView.gradientStartColor = UIColor.inCommingBlue
		audioVisualizationView.gradientStartColor = UIColor.inCommingBlue
		audioVisualizationView.meteringLevels = audioVisualizationView.scaleSoundDataToFitScreen()
		wave.view.addSubview(audioVisualizationView)
	}
	
	// MARK: - Helpers
	
	@objc private func play() {
		print("play")
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		button.style.preferredSize = CGSize.init(width: 30, height: 30)
		//bubble.style.preferredSize = CGSize.init(width: 250, height: 44)
		wave.style.height = ASDimension.init(unit: .points, value: 44)
		wave.style.flexGrow = 1
				
		let buttonSpec = ASStackLayoutSpec.init(direction: .horizontal, spacing: 5, justifyContent: .spaceBetween, alignItems: .center, flexWrap: .wrap, alignContent: .spaceBetween, children: [button, wave, time])
		
		let buttonInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(7, 7, 7, 20), child: buttonSpec)
		
		let backgroundSpec = ASBackgroundLayoutSpec(child: buttonInsetnsSpec, background: bubble)
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 20, 5, 100), child: backgroundSpec)
		
		return stackInsetnsSpec
	}
}
