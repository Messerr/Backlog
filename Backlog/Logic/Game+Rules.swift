//
//  Game+Rules.swift
//  Backlog
//
//  Created by David Messer on 6/30/26.
//

import Foundation

extension Game {
    var isValid: Bool {
        let trimmed = title.trimmingCharacters(in: .whitespaces)
        return !trimmed.isEmpty
            && hoursPlayed >= 0
            && (rating == nil || (1...5).contains(rating ?? 0))
    }
    
    mutating func transition(to newStatus: Status) -> Bool {
        if self.status.allowedTransitions().contains(newStatus) {
            self.status = newStatus
            return true
        } else {
            return false
        }
    }
}
