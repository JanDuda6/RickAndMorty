//
//  ApiRequester.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import Foundation

class ApiRequester {
    static let shared = ApiRequester()

    func fetchResponse(url: String? = nil) async throws -> Data? {
        guard let stringUrl = url, let url = URL(string: stringUrl) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpRespons = response as? HTTPURLResponse, httpRespons.statusCode == 200 else { return nil }
            return data
        } catch {
            print("@@@ Networking error: \(error)")
            return nil
        }
    }
}
