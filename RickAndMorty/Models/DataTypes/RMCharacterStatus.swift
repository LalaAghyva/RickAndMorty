//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Lala on 25.02.25.
//

import Foundation

enum RMCharacterStatus : String, Codable {
//    ('Alive', 'Dead' or 'unknown')
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}

