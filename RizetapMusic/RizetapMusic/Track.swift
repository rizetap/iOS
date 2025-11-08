//
//  Track.swift
//  RizetapMusic
//
//  Created by Perizat Muratova on 29.11.2025.
//
import UIKit

struct Track {
    let title: String
    let artist: String
    let coverImageName: String
    let audioFileName: String
    let audioFileExtension: String
    
    var coverImage: UIImage? {
        return UIImage(named: coverImageName)
    }
}

