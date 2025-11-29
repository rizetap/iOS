//
//  NetworkService.swift
//  Superhero
//
//  Created by Perizat Muratova on 08.12.2025.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(String)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received from server"
        case .decodingError:
            return "Failed to decode superhero data"
        case .serverError(let message):
            return "Server error: \(message)"
        }
    }
}

class NetworkService {
    static let shared = NetworkService()
    private let baseURL = "https://akabab.github.io/superhero-api/api"
    
    // Total number of superheroes in the API (approximate)
    private let totalHeroes = 563
    
    private init() {}
    
    // MARK: - Fetch Random Superhero
    func fetchRandomSuperhero(completion: @escaping (Result<Superhero, NetworkError>) -> Void) {
        // Generate random ID between 1 and 563
        let randomID = Int.random(in: 1...totalHeroes)
        
        let urlString = "\(baseURL)/id/\(randomID).json"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for network errors
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            // Check for data
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            // Try to decode the JSON
            do {
                let decoder = JSONDecoder()
                let superhero = try decoder.decode(Superhero.self, from: data)
                completion(.success(superhero))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    // MARK: - Download Image
    func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
