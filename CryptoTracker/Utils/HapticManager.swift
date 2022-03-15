//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Tyler Aguirre on 3/14/22.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
