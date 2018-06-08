//
//  Message.swift
//  OkDoc
//
//  Created by workmachine on 27.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers
class Message: Object {
	dynamic var text: String = ""
	dynamic var imageData: Data? = nil
	dynamic var videoURL: String = ""
	dynamic var audioURL: String = ""
	dynamic var date: Date? = nil
	dynamic var incomming: Bool = false
	dynamic var metters = List<Float>()

	
	convenience init(text: String, imageData: Data?, videoURL: String, audioURL: String, metters: List<Float>, date: Date?, incomming: Bool) {
		self.init()
		self.text		= text
		self.imageData	= imageData
		self.videoURL	= videoURL
		self.audioURL	= audioURL
		self.date		= date
		self.incomming 	= incomming
		self.metters 	= metters
	}
}
