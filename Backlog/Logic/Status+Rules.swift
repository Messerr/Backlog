//
//  Status+Rules.swift
//  Backlog
//
//  Created by David Messer on 6/24/26.
//

import Foundation

extension Status {
    var displayName: String {
        switch self {
        case .backlog:
            return "Backlog"
        case .playing:
            return "In Progress"
        case .finished:
            return "Finished"
        case .abandoned:
            return "Abandoned"
        }
    }
    
    func allowedTransitions() -> [Status] {
        switch self {
        case .backlog:
            return [.playing]
        case .playing:
            return [.finished, .abandoned, .backlog]
        case .finished:
            return [.playing]
        case .abandoned:
            return [.playing, .backlog]
        }
    }
}
