//
//  Status.swift
//  Backlog
//
//  Created by David Messer on 6/24/26.
//

import Foundation

enum Status: String, Codable, CaseIterable {
    case backlog
    case playing
    case finished
    case abandoned
}
