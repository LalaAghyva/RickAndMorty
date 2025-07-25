//
//  RMService.swift
//  RickAndMorty
//
//  Created by Lala on 25.02.25.
//

import Foundation

/// Primary API Service object to get data
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty api call
    /// - Parameters:
    ///   - request: request instance
    ///   - type: The type of object we except to get back
    ///   - completion: callback with data or error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            // decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
//                let json = try JSONSerialization.jsonObject(with: data)
//                print(String(describing: json))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    
    // MARK:-Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
