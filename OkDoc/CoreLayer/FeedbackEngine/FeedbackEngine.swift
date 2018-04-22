//
//  FeedbackEngine.swift
//  OkDoc
//
//  Created by workmachine on 22.04.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit.UIFeedbackGenerator

class FeedbackEngine {
    func feedback(type: EngineType) {
        switch type {
        case .notification(let type):
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(type)
        case .impact(let type):
            let generator = UIImpactFeedbackGenerator(style: type)
            generator.impactOccurred()
        case .selection:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        }
    }
}

extension FeedbackEngine {
    enum EngineType {
        case notification (UINotificationFeedbackType)
        case impact (UIImpactFeedbackStyle)
        case selection
    }
}
