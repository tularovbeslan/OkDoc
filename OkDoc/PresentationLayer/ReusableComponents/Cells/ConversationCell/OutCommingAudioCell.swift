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
	var audioVisualizationView: AudioVisualizationView?
	var button: ASButtonNode
	var duration: TimeInterval!
	let audioPlayer: AudioPlayerManager
	fileprivate var bubble: ASDisplayNode
	fileprivate var time: ASTextNode
	fileprivate var wave: ASDisplayNode
	fileprivate var metters: [Float] = []
	fileprivate var fileName: String = ""
	
	init(model: Message) {
		bubble					= ASDisplayNode()
		button					= ASButtonNode()
		time					= ASTextNode()
		wave					= ASDisplayNode()
		audioPlayer				= AudioPlayerManager.shared
		super.init()
		
		DispatchQueue.main.async {
			self.audioVisualizationView	= AudioVisualizationView(frame: .zero)
		}
		
		selectionStyle = .none
		
		button.setImage(#imageLiteral(resourceName: "playInComming"), for: .normal)
		button.addTarget(self, action: #selector(playAudio), forControlEvents: ASControlNodeEvent.touchUpInside)
		
		
		fileName = model.audioURL
		model.metters.forEach { (metter) in
			metters.append(metter)
		}
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5.0
		paragraphStyle.alignment = .center
		
		let attributes = [
			NSAttributedStringKey.font: UIFont.avertaCY(style: .Semibold, size: 11),
			NSAttributedStringKey.paragraphStyle: paragraphStyle,
			NSAttributedStringKey.foregroundColor: UIColor.black
		]
		
		time.attributedText = NSAttributedString.init(string: "00:00", attributes: attributes)
		
		
		addSubnode(bubble)
		addSubnode(button)
		addSubnode(time)
		addSubnode(wave)
		
		addPlayerObserver()
	}
	
	deinit {
		removeObserver()
	}
	
	override func didLoad() {
		bubble.clipsToBounds = true
		bubble.backgroundColor = .outCommingGray
		wave.backgroundColor = .blue
	}
	
	override func layoutDidFinish() {
		bubble.cornerRadius = 22
		button.view.tag = Int(arc4random())
		audioVisualizationView?.frame = wave.view.bounds
		audioVisualizationView?.meteringLevels = metters
		audioVisualizationView?.backgroundColor = UIColor.outCommingGray
		audioVisualizationView?.gradientStartColor = UIColor.init(red: 223/255, green: 223/255, blue: 223/255, alpha: 1)
		audioVisualizationView?.gradientEndColor = UIColor.inCommingBlue
		audioVisualizationView?.meteringLevels = audioVisualizationView?.scaleSoundDataToFitScreen()
		wave.view.addSubview(audioVisualizationView!)
	}
	
	// MARK: - Helpers
	
	@objc func playAudio() {
		if audioPlayer.tag != button.view.tag {
			audioPlayer.state = .stop
		}

		audioHandler()
	}
	
	func audioHandler() {
		let url = FileStorageManager.urlFrom(directory: .Audios, and: fileName)
		do {
			switch audioPlayer.state {
			case .playing:
				try! audioPlayer.pause()
				audioVisualizationView?.pause()
				button.setImage(#imageLiteral(resourceName: "playInComming"), for: .normal)
			case .paused:
				duration = try audioPlayer.resume()
				audioVisualizationView?.play(for: duration)
				button.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
			case .stop:
				audioPlayer.tag = button.view.tag
				duration = try audioPlayer.play(at: url, with: 0.05, cell: self)
				audioVisualizationView?.play(for: duration)
				button.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
			}
		} catch {

		}
	}
	
	func addPlayerObserver() {
		NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinish), name: .meteringLevelDidFinish, object: nil)
	}
	
	func removeObserver() {
		NotificationCenter.default.removeObserver(self, name: .meteringLevelDidFinish, object: nil)
	}
	
	@objc func playerDidFinish() {
		button.setImage(#imageLiteral(resourceName: "playInComming"), for: .normal)
	}
	
	func countdown(current: TimeInterval) {
		setTimeTitle(time: duration - current)
	}
	
	private func setTimeTitle(time: TimeInterval) {
		let currentTime =  Int(time)
		let minutes = currentTime / 60
		let seconds = currentTime - minutes * 60
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 5.0
		
		let attributes = [
			NSAttributedStringKey.font: UIFont.avertaCY(style: .Semibold, size: 11),
			NSAttributedStringKey.paragraphStyle: paragraphStyle,
			NSAttributedStringKey.foregroundColor: UIColor.black
		]
		
		self.time.attributedText = NSAttributedString(string: String.init(format: "%.2d:%.2d", minutes, seconds), attributes: attributes)
	}
	
	func stopPlaying() {
		button.setImage(#imageLiteral(resourceName: "playInComming"), for: .normal)
		audioVisualizationView?.stop()
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		button.style.preferredSize 	= CGSize.init(width: 30, height: 30)
		wave.style.height 			= ASDimension.init(unit: .points, value: 30)
		wave.style.flexGrow 		= 1
		time.style.width 			= ASDimension.init(unit: .points, value: 35)
		let buttonSpec = ASStackLayoutSpec.init(direction: .horizontal, spacing: 5, justifyContent: .spaceBetween, alignItems: .center, flexWrap: .wrap, alignContent: .spaceBetween, children: [button, wave, time])
		
		let buttonInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(7, 7, 7, 15), child: buttonSpec)
		
		let backgroundSpec = ASBackgroundLayoutSpec(child: buttonInsetnsSpec, background: bubble)
		
		let stackInsetnsSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(5, 20, 5, 50), child: backgroundSpec)
		
		return stackInsetnsSpec
	}
}




