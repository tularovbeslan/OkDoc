//
//  FeedbackServiceImplementation.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Foundation

class FeedbackServiceImplementation: FeedbackService {
    // MARK: - Properties
    var feedbackEngine: FeedbackEngine!
    
    // MARK: - FeedbackService
    func feedback(by type: FeedbackEngine.EngineType) {
        feedbackEngine.feedback(type: type)
    }
}
