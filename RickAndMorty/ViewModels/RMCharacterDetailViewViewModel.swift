//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Lala on 27.03.25.
//

import UIKit

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
}
