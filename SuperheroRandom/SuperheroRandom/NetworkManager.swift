//
//  NetworkManager.swift
//  SuperheroRandom
//
//  Created by Perizat Muratova on 08.12.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://akabab.github.io/superhero-api/api"
    private var allSuperheroes: [Superhero] = []
    
    private init() {}
    
    // Fetch all superheroes (for random selection)
    func fetchAllSuperheroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        let url = "\(baseURL)/all.json"
        
        AF.request(url).responseDecodable(of: [Superhero].self) { response in
            switch response.result {
            case .success(let superheroes):
                self.allSuperheroes = superheroes
                completion(.success(superheroes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Get random superhero
    func getRandomSuperhero() -> Superhero? {
        guard !allSuperheroes.isEmpty else { return nil }
        return allSuperheroes.randomElement()
    }
    
    // Fetch superhero by ID
    func fetchSuperhero(byId id: Int, completion: @escaping (Result<Superhero, Error>) -> Void) {
        let url = "\(baseURL)/id/\(id).json"
        
        AF.request(url).responseDecodable(of: Superhero.self) { response in
            switch response.result {
            case .success(let superhero):
                completion(.success(superhero))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
