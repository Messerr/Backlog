//
//  ContentView.swift
//  Backlog
//
//  Created by David Messer on 6/24/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    let _ = print("Games finished: \(sample.games(withStatus: .finished).count)")
    let _ = print("Games with 'mario': \(sample.search("mario").count)")
    let _ = print("Blank query returns all: \(sample.search("    ").count)")
    let _ = print("Total finished hours: \(sample.totalFinishedHours)")
    let _ = print("Completion Rate \(sample.completionRate)")
    let _ = print("Sorted", sample.sortedByRating().map { game in game.title })
    let _ = print("Average Rating by Genre: \(sample.averageRatingByGenre())")
    Text("Check Console [:")
}
