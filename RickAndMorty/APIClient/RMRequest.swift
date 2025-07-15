//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Lala on 25.02.25.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    ///api constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    ///desire endpoint
    private let endpoint: RMEndPoint
    
    ///path componenets for API, if any
    private let pathComponenets: [String]
     
    ///query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    ///constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponenets.isEmpty {
            pathComponenets.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    ///computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    ///desired http method
    public let httpMethod = "GET"
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - endpoint: target endpoint
    ///   - pathComponenets: collection of path componenets
    ///   - queryParameters: collection of query parametrs
    public init(
        endpoint: RMEndPoint,
        pathComponenets: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponenets = pathComponenets
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharacterRequests = RMRequest(endpoint: .character)
}
