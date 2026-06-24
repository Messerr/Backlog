//
//  Game.swift
//  Backlog
//
//  Created by David Messer on 6/24/26.
//

import Foundation

struct Game: Identifiable, Hashable {
    let id: UUID
    var title: String
    var platform: String
    var genre: String
    var status: Status
    var rating: Int?
    var hoursPlayed: Double
    var addedAt: Date
}
