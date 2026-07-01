//
//  GameService.swift
//  Backlog
//
//  Created by David Messer on 7/1/26.
//

import Foundation

enum GameServiceError: Error {
    case badURL
    case badResponse(status: Int)
    case decoding(Error)
    case transport(Error)
}

protocol GameServing {
    func fetchGames() async throws -> [Game]
}

struct GameService: GameServing {
    let endpoint: URL

    func fetchGames() async throws -> [Game] {
        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await URLSession.shared.data(from: endpoint)
        } catch {
            throw GameServiceError.transport(error)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw GameServiceError.badResponse(status: -1)
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw GameServiceError.badResponse(status: httpResponse.statusCode)
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Game].self, from: data)
        } catch {
            throw GameServiceError.decoding(error)
        }
    }
}
