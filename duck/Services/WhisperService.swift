//
//  WhisperService.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import Foundation

class WhisperService {
    func recognize() async throws -> String {
        let urlString = "https://pokeapi.co/api/v2/pokemon/pikachu"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        guard let dataString = String(data: data, encoding: .utf8) else {
            throw URLError(.cannotDecodeContentData)
        }

        return dataString
    }
}
