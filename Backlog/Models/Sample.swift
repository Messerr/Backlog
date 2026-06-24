//
//  Sample.swift
//  Backlog
//
//  Created by David Messer on 6/24/26.
//

import Foundation

let sample: [Game] = [
    Game(
        id: UUID(),
        title: "Super Mario",
        platform: "SNES",
        genre: "Platformer",
        status: .finished,
        rating: 5,
        hoursPlayed: 10.0,
        addedAt: .now
    ),
    Game(
        id: UUID(),
        title: "Donkey Kong",
        platform: "Wii",
        genre: "Platformer",
        status: .playing,
        rating: 4,
        hoursPlayed: 15.0,
        addedAt: .now
    ),
    Game(
        id: UUID(),
        title: "The Legend of Zelda",
        platform: "NES",
        genre: "RPG",
        status: .abandoned,
        rating: 3,
        hoursPlayed: 100.0,
        addedAt: .now
    ),
    Game(
        id: UUID(),
        title: "God of War",
        platform: "PS3",
        genre: "Action",
        status: .finished,
        rating: 5,
        hoursPlayed: 20.0,
        addedAt: .now
    ),
    Game(
        id: UUID(),
        title: "Elden Ring",
        platform: "PC",
        genre: "RPG",
        status: .finished,
        rating: 5,
        hoursPlayed: 300.0,
        addedAt: .now
    ),
    Game(
        id: UUID(),
        title: "Bloodborne",
        platform: "PS4",
        genre: "Soulslike",
        status: .finished,
        rating: 5,
        hoursPlayed: 900.0,
        addedAt: .now
    ),
    Game(
        id: UUID(),
        title: "Dark Souls II",
        platform: "PS3",
        genre: "Difficult",
        status: .playing,
        rating: nil,
        hoursPlayed: 500.0,
        addedAt: .now
    ),
    Game(
        id: UUID(),
        title: "Hades",
        platform: "Switch",
        genre: "Roguelike",
        status: .backlog,
        rating: nil,
        hoursPlayed: 0.0,
        addedAt: .now
    )
]
