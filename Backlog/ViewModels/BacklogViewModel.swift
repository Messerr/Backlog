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
        fatalError("TODO")
    }
    
    var visibleGames: [Game] {
        fatalError("TODO")
    }
}
