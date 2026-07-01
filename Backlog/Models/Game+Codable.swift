//
//  Game+Codable.swift
//  Backlog
//
//  Created by David Messer on 7/1/26.
//

import Foundation

extension Game: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, title, platform, genre, status, rating
        case hoursPlayed = "hours_played"
        case addedAt = "added_at"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(UUID.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.platform = try container.decode(String.self, forKey: .platform)
        self.genre = try container.decode(String.self, forKey: .genre)
        self.status = try container.decode(Status.self, forKey: .status)
        self.rating = try container.decodeIfPresent(Int.self, forKey: .rating)
        self.hoursPlayed = try container.decode(Double.self, forKey: .hoursPlayed)
        self.addedAt = try container.decode(Date.self, forKey: .addedAt)
    }
}
