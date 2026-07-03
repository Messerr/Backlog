//
//  BacklogViewModel.swift
//  Backlog
//
//  Created by David Messer on 7/1/26.
//

import Foundation
import Observation

@Observable
final class BacklogViewModel {
    enum LoadState: Equatable {
        case idle
        case loading
        case loaded
        case failed(String)
    }
    private(set) var state: LoadState = .idle
    private(set) var games: [Game] = []
    var query: String = ""
    var statusFilter: Status? = nil
    private let service: GameServing
    
    init(service: GameServing) {
        self.service = service
    }
    
    @MainActor
    func load() async {
        state = .loading
        do {
            games = try await service.fetchGames()
            state = .loaded
        } catch let error as GameServiceError {
            state = .failed(message(for: error))
        } catch {
            state = .failed("Something went wrong")
        }
    }
    
    var visibleGames: [Game] {
        var filteredGames = games
        
        if let statusFilter = statusFilter {
            filteredGames = filteredGames.games(withStatus: statusFilter)
        }
        
        return filteredGames
            .search(query)
            .sortedByRating()
    }
    
    private func message(for error: GameServiceError) -> String {
        switch error {
        case .badURL:
            return "That address doesn't look right."
        case .badResponse(let status):
            return "The server returned an error (\(status))."
        case .decoding:
            return "We couldn't read the games data."
        case .transport:
            return "Check your connection and try again."
        }
    }
}

struct FakeService: GameServing {
    func fetchGames() async throws -> [Game] {
        sample
    }
}
