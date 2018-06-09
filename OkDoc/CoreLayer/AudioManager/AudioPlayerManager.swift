//
//  AudioPlayerManager.swift
//  OkDoc
//
//  Created by workmachine on 07.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayerManager: NSObject {
	
	static let shared = AudioPlayerManager()
	
	let audioPercentageUserInfoKey = "percentage"

	var isRunning: Bool {
		guard let audioPlayer = self.audioPlayer, audioPlayer.isPlaying else {
			return false
		}
		return true
	}
	
	var state: AudioPlayerState = .stop
	var timer: DispatchSourceTimer!
	var tag: Int = 0
	
	private var audioPlayer: AVAudioPlayer?
	private var audioMeteringLevelTimer: Timer?
	private var currentCell: OutCommingAudioCell?
	private var preCell: OutCommingAudioCell?

	
	func play(at url: URL, with audioVisualizationTimeInterval: TimeInterval = 0.05, cell: OutCommingAudioCell) throws -> TimeInterval {
		preCell = currentCell
		currentCell = cell
		progress()
		if currentCell == preCell {
			if self.isRunning {
				self.audioPlayer?.pause()
				state = .paused
				
			} else {
				try self.audioPlayer = AVAudioPlayer(contentsOf: url)
				self.setupPlayer(with: audioVisualizationTimeInterval)
				state = .playing
			}
		} else {
			try self.audioPlayer = AVAudioPlayer(contentsOf: url)
			self.setupPlayer(with: audioVisualizationTimeInterval)
			state = .playing
		}
		
		if preCell != nil {
			preCell?.button.setImage(#imageLiteral(resourceName: "playInComming"), for: .normal)
			preCell?.audioVisualizationView?.stop()
		}
		
		return self.audioPlayer!.duration
	}
	
	private func setupPlayer(with audioVisualizationTimeInterval: TimeInterval) {
		if let player = self.audioPlayer {
			player.play()
			player.isMeteringEnabled = true
			player.delegate = self
			
			self.audioMeteringLevelTimer = Timer.scheduledTimer(timeInterval: audioVisualizationTimeInterval, target: self, selector: #selector(AudioPlayerManager.timerDidUpdateMeter), userInfo: nil, repeats: true)
		}
	}
	
	func resume() throws -> TimeInterval {
		if self.audioPlayer?.play() == false {
			throw AudioErrorType.internalError
		}
		state = .playing
		timer.resume()
		return self.audioPlayer!.duration - self.audioPlayer!.currentTime
	}
	
	func pause() throws {
		if !self.isRunning {
			throw AudioErrorType.notCurrentlyPlaying
		}
		
		state = .paused
		timer.suspend()
		self.audioPlayer?.pause()
	}
	
	func stop() throws {
		if !self.isRunning {
			throw AudioErrorType.notCurrentlyPlaying
		}
		state = .stop
		timer.cancel()
		self.audioPlayer?.stop()
	}
	
	func progress() {
		let queue = DispatchQueue(label: "com.domain.app.timer")
		timer = DispatchSource.makeTimerSource(queue: queue)
		timer.setEventHandler { [weak self] in
			guard let current = self?.audioPlayer?.currentTime else { return }
			guard let duration = self?.audioPlayer?.duration else { return }
			self?.currentCell?.countdown(current: current, duration: duration)
			
		}
		timer.schedule(deadline: .now(), repeating: 1.0)
		timer.resume()
	}
	
	@objc private func timerDidUpdateMeter() {
		if self.isRunning {
			self.audioPlayer!.updateMeters()
			let averagePower = self.audioPlayer!.averagePower(forChannel: 0)
			let percentage: Float = pow(10, (0.05 * averagePower))
		NotificationCenter.default.post(name: .meteringLevelDidUpdate, object: self, userInfo: [audioPercentageUserInfoKey: percentage])
		}
	}
}

extension AudioPlayerManager: AVAudioPlayerDelegate {
	func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
		NotificationCenter.default.post(name: .meteringLevelDidFinish, object: self)
		state = .stop
		timer.cancel()
	}
}

extension Notification.Name {
	static let meteringLevelDidUpdate = Notification.Name("meteringLevelDidUpdate")
	static let meteringLevelDidFinish = Notification.Name("meteringLevelDidFinish")
	static let audioPlayerWillPlay = Notification.Name("audioPlayerWillPlay")
}

enum AudioPlayerState {
	case stop
	case playing
	case paused
}

