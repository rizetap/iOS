//
//  PlaylistManager.swift
//  RizetapMusic
//
//  Created by Perizat Muratova on 29.11.2025.
//
import UIKit

enum RepeatMode {
    case off
    case all
    case one
}

class PlaylistManager {
    let tracks: [Track]
    private(set) var currentIndex: Int = 0
    var repeatMode: RepeatMode = .off
    
    var currentTrack: Track? {
        guard currentIndex >= 0 && currentIndex < tracks.count else { return nil }
        return tracks[currentIndex]
    }
    
    init(tracks: [Track]) {
        self.tracks = tracks
    }
    
    // Move to next track safely
    @discardableResult
    func nextTrack() -> Bool {
        if currentIndex < tracks.count - 1 {
            currentIndex += 1
            return true
        } else if repeatMode == .all {
            currentIndex = 0
            return true
        }
        return false
    }
    
    // Move to previous track safely
    @discardableResult
    func previousTrack() -> Bool {
        if currentIndex > 0 {
            currentIndex -= 1
            return true
        } else if repeatMode == .all {
            currentIndex = tracks.count - 1
            return true
        }
        return false
    }
}

