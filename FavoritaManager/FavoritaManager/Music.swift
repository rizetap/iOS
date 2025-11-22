//
//  Music.swift
//  FavoritaManager
//
//  Created by Perizat Muratova on 08.12.2025.
//

import UIKit

struct Music {
    let title: String
    let imageName: String
    let description: String
    let review: String
    
    // Sample data
    static let sampleMusic: [Music] = [
        Music(
            title: "Svidanie - Tvoim Imenem",
            imageName: "music.note",
            description: "A heartfelt track with emotive vocals and soft instrumentals, capturing the feeling of longing and connection.",
            review: "Beautifully emotional and moving. Perfect for a reflective mood. 5/5 stars."
        ),
        Music(
            title: "Svidanie - Rodinki",
            imageName: "music.note",
            description: "A gentle and nostalgic song with tender melodies and intimate lyrics, highlighting personal memories.",
            review: "Soft, melancholic, and deeply touching. A song that stays with you. 5/5 stars."
        ),
        Music(
            title: "Daite Tank - Utro",
            imageName: "music.note",
            description: "An energetic and vibrant track that blends rock and indie elements, perfect for morning motivation.",
            review: "Fresh, lively, and uplifting. Gets you moving instantly. 5/5 stars."
        ),
        Music(
            title: "Daite Tank - Derevo",
            imageName: "music.note",
            description: "A reflective indie-rock piece with strong instrumentation and thought-provoking lyrics.",
            review: "Rich and layered. Makes you think while enjoying the sound. 5/5 stars."
        ),
        Music(
            title: "Daite Tank - Nashel",
            imageName: "music.note",
            description: "A powerful and melodic track with memorable hooks and engaging rhythm.",
            review: "Catchy and compelling. Keeps playing in your head. 5/5 stars."
        ),
        Music(
            title: "TV Girl - Song About You",
            imageName: "music.note",
            description: "A lo-fi indie pop song with playful lyrics and an infectious beat, capturing bittersweet nostalgia.",
            review: "Fun and dreamy. Perfect for chill vibes. 5/5 stars."
        ),
        Music(
            title: "TV Girl - Loving Machine",
            imageName: "music.note",
            description: "A quirky and upbeat track with electronic influences and clever wordplay.",
            review: "Energetic and witty. Makes you smile every time. 5/5 stars."
        ),
        Music(
            title: "TV Girl - Louise",
            imageName: "music.note",
            description: "A mellow, lo-fi track with emotional lyrics and a warm, nostalgic feel.",
            review: "Smooth and emotive. A hidden gem for indie lovers. 5/5 stars."
        ),
        Music(
            title: "Blood Orange - Champagne Coast",
            imageName: "music.note",
            description: "A dreamy, atmospheric track blending R&B, soul, and electronic textures. Captures a sense of longing and elegance.",
            review: "Lush and mesmerizing. Perfect for late-night listening. 5/5 stars."
        ),
        Music(
            title: "Mitski - Townie",
            imageName: "music.note",
            description: "A raw and energetic track reflecting teenage frustration, identity, and small-town life.",
            review: "Intense and cathartic. Mitski at her most powerful. 5/5 stars."
        )
    ]
}
