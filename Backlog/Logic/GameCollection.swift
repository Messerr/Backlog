//
//  GameCollection.swift
//  Backlog
//
//  Created by David Messer on 6/24/26.
//

import Foundation

extension Array where Element == Game {
    func games(withStatus status: Status) -> [Game] {
        self.filter { game in
            return status == game.status
        }
    }
    
    func search(_ query: String) -> [Game] {
        let trimmed = query.trimmingCharacters(in: .whitespaces)
        
        if trimmed.isEmpty { return self }
        
        return self.filter { game in
            game.title.localizedCaseInsensitiveContains(trimmed) || game.platform.localizedCaseInsensitiveContains(trimmed)
        }
    }
    
    func sortedByRating() -> [Game] {
        self.sorted { a, b in
            let ra = a.rating ?? 0
            let rb = b.rating ?? 0
            if ra == rb {
                return a.title.localizedCaseInsensitiveCompare(b.title) == .orderedAscending
            } else {
                return ra > rb
            }
        }
    }
    
    var totalFinishedHours: Double {
        self.games(withStatus: .finished)
            .reduce(0.0) { total, game in
                total + game.hoursPlayed
            }
    }
    
    func averageRatingByGenre() -> [String: Double] {
        let ratedGames = self.filter { game in
            game.rating != nil
        }
        let nonNilRating = Dictionary(grouping: ratedGames) { game in
            game.genre
        }
        
        return nonNilRating.mapValues { gamesInGenre in
            let sum = gamesInGenre.reduce(0) { total, game in total + (game.rating ?? 0) }
            return Double(sum) / Double(gamesInGenre.count)
        }
    }
    
    var completionRate: Double {
        guard !self.isEmpty else { return 0 }
        
        let finishedCount = self.games(withStatus: .finished).count
        let totalCount = self.count
        return Double(finishedCount) / Double(totalCount)
    }
}
