//
//  StoredGame.swift
//  Backlog
//
//  Created by David Messer on 7/3/26.
//

import Foundation
import SwiftData

@Model
final class StoredGame {
    var id: UUID
    var title: String
    var platform: String
    var genre: String
    var statusRaw: String
    var rating: Int?
    var hoursPlayed: Double
    var addedAt: Date
    
    init(
        id: UUID,
        title: String,
        platform: String,
        genre: String,
        statusRaw: String,
        rating: Int?,
        hoursPlayed: Double,
        addedAt: Date
    ) {
        self.id = id
        self.title = title
        self.platform = platform
        self.genre = genre
        self.statusRaw = statusRaw
        self.rating = rating
        self.hoursPlayed = hoursPlayed
        self.addedAt = addedAt
    }
}

extension StoredGame {
    func toGame() -> Game {
        Game(
            id: id,
            title: title,
            platform: platform,
            genre: genre,
            status: Status(rawValue: statusRaw) ?? .backlog,
            rating: rating,
            hoursPlayed: hoursPlayed,
            addedAt: addedAt
        )
    }
}

struct GameStore {
    let context: ModelContext
    
    func insert(_ game: Game) throws -> Bool {
        fatalError("TODO")
    }
    
    func games(withStatus status: Status) throws -> [Game] {
        fatalError("TODO")
    }
    
    func delete(id: UUID) throws {
        let target = id
        let descriptor = FetchDescriptor<StoredGame>(
            predicate: #Predicate { stored in stored.id == target }
        )
        let matches = try context.fetch(descriptor)
        if let found = matches.first {
            context.delete(found)
            try context.save()
        }
    }
}
