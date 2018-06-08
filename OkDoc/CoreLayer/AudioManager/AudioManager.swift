//
//  AudioManager.swift
//  OkDoc
//
//  Created by workmachine on 07.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import AVFoundation

class AudioManager {
	
	var player: AVAudioPlayer!
	
	
	
	
	
	
	
	
	
	func setSessionPlayback() {
		let session = AVAudioSession.sharedInstance()
		do {
			try session.setCategory(AVAudioSessionCategoryPlayback, with: .defaultToSpeaker)
		} catch {
			print(error.localizedDescription)
		}
		
		do {
			try session.setActive(true)
		} catch {
			print(error.localizedDescription)
		}
	}
}
