//
//  Decoder.swift
//  RickAndMorty
//
//  Created by Jan Duda on 18/05/2025.
//

import Foundation

struct Decoder {
    static func decode<T: Codable>(from data: Data?) -> T? {
        guard let data else { return nil }
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            print("@@@ Decoding error: ", error)
            return nil
        }
    }
}
