//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by Lala on 25.02.25.
//

import Foundation

/// represents unique API endpoint
@frozen enum RMEndPoint: String {
    ///endpoint to get character info
    case character
    ///endpoint to get location info
    case location
    ///endpoint to get episode info
    case episode
}
