//
//  FeedbackService.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

protocol FeedbackService {
	@available(iOS 10.0, *)
	func feedback(by type: FeedbackEngine.EngineType)
}
