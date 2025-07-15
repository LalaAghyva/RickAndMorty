//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Lala on 02.03.25.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
