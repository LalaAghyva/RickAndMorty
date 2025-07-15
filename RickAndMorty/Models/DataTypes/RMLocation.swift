//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Lala on 25.02.25.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
}

