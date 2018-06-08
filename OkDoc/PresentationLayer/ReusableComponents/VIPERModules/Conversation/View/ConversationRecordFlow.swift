//
//  ConversationRecordFlow.swift
//  OkDoc
//
//  Created by workmachine on 07.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import AVFoundation

extension ConversationViewController {
	@objc func updateAudioMeter(_ timer: Timer) {
		if let recorder = self.recorder {
			if recorder.isRecording {
				recorder.updateMeters()
				let averagePower = recorder.averagePower(forChannel: 0)
				let percentage: Float = pow(10, (0.05 * averagePower))
				print(percentage)
				try! realManager.realm.write {
					metters.append(percentage)
				}
			}
		}
	}
	
	 func startRecord() {
		if recorder == nil {
			recordWithPermission(true)
			return
		}
	}
	
	func stopRecording() {
		recorder?.stop()
		meterTimer.invalidate()
	}
	
	func getFileName() -> String {
		let format = DateFormatter()
		format.dateFormat="yyyy-MM-dd-HH-mm-ss"
		let fileName = "recording-\(format.string(from: Date())).m4a"
		return fileName
	}
	
	func setupRecorder() {
		self.audioFileURL = FileStorageManager.urlFrom(directory: .Audios, and: getFileName())
		
		let recordSettings: [String: Any] = [
			AVFormatIDKey: kAudioFormatAppleLossless,
			AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
			AVNumberOfChannelsKey: 1,
			AVSampleRateKey: 12000
		]
		
		do {
			recorder = try AVAudioRecorder(url: audioFileURL, settings: recordSettings)
			recorder?.delegate = self
			recorder?.isMeteringEnabled = true
			recorder?.prepareToRecord() // creates/overwrites the file at soundFileURL
		} catch {
			recorder = nil
			print(error.localizedDescription)
		}
	}
	
	func recordWithPermission(_ setup: Bool) {
		AVAudioSession.sharedInstance().requestRecordPermission {
			[unowned self] granted in
			if granted {
				DispatchQueue.main.async {
					self.setSessionPlayAndRecord()
					if setup { self.setupRecorder() }
					self.recorder?.record()
					self.meterTimer = Timer.scheduledTimer(timeInterval: 0.1,
														   target: self,
														   selector: #selector(self.updateAudioMeter(_:)),
														   userInfo: nil,
														   repeats: true)
				}
			} else {
				print("Permission to record not granted")
			}
		}
		
		if AVAudioSession.sharedInstance().recordPermission() == .denied {
			print("permission denied")
		}
	}
	
	func setSessionPlayAndRecord() {
		let session = AVAudioSession.sharedInstance()
		do {
			try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
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

extension ConversationViewController: AVAudioRecorderDelegate {
	func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder,
										 successfully flag: Bool) {
		sendAudio(urlString: getFileName())
		self.recorder = nil
		self.metters.removeAll()
	}
	
	func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
		if let e = error {
			print("\(e.localizedDescription)")
		}
	}
}
