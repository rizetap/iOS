//
//  UserDefaultsManager.swift
//  SuperheroRandom
//
//  Created by Perizat Muratova on 08.12.2025.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let lastSuperheroIdKey = "lastSuperheroId"
    
    private init() {}
    
    // Save last superhero ID
    func saveLastSuperhero(id: Int) {
        UserDefaults.standard.set(id, forKey: lastSuperheroIdKey)
    }
    
    // Get last superhero ID
    func getLastSuperheroId() -> Int? {
        let id = UserDefaults.standard.integer(forKey: lastSuperheroIdKey)
        return id > 0 ? id : nil
    }
    
    // Clear saved superhero
    func clearLastSuperhero() {
        UserDefaults.standard.removeObject(forKey: lastSuperheroIdKey)
    }
}
