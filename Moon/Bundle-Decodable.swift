//
//  Bundle-Decodable.swift
//  Moon
//
//  Created by Boubacar sidiki barry on 22.06.23.
//

import Foundation
extension Bundle {
    func decode<T : Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        //formatter l'affichage de la date
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
