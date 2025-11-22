//
//  Movie.swift
//  FavoritaManager
//
//  Created by Perizat Muratova on 08.12.2025.
//

import UIKit

struct Movie {
    let title: String
    let imageName: String
    let description: String
    let review: String
    
    // Sample data
    static let sampleMovies: [Movie] = [
        Movie(
            title: "The Fly",
            imageName: "film",
            description: "A brilliant but eccentric scientist's experiment goes horribly wrong, turning him into a human-fly hybrid. A classic body horror story.",
            review: "Disturbing, inventive, and unforgettable. Cronenberg at his finest. 5/5 stars."
        ),
        Movie(
            title: "Audition",
            imageName: "film",
            description: "A widower holds a fake audition to find a new wife, only to discover the dark and terrifying secrets of his chosen woman. Japanese psychological horror at its peak.",
            review: "Shocking and haunting. The tension builds perfectly. 5/5 stars."
        ),
        Movie(
            title: "What We Do in the Shadows",
            imageName: "film",
            description: "A mockumentary following vampire roommates in New Zealand struggling with modern life, chores, and rivalries. Hilarious and absurd.",
            review: "Side-splittingly funny and surprisingly clever. A cult classic. 5/5 stars."
        ),
        Movie(
            title: "Look Back (anime)",
            imageName: "film",
            description: "An emotional anime exploring friendship, ambition, and the bittersweet nature of pursuing your dreams in art and life.",
            review: "Beautifully animated and deeply moving. Will stay with you for days. 5/5 stars."
        ),
        Movie(
            title: "Christine",
            imageName: "film",
            description: "A mysterious car exerts a deadly influence over its owner, driving obsession, jealousy, and horror. Stephen King’s classic adapted to film.",
            review: "Creepy and thrilling. Perfect mix of horror and suspense. 5/5 stars."
        ),
        Movie(
            title: "The Platform",
            imageName: "film",
            description: "A dystopian prison with a vertical structure reveals humanity's greed and survival instincts as food descends floor by floor.",
            review: "Brutal and thought-provoking. A unique social commentary. 5/5 stars."
        ),
        Movie(
            title: "Better Days",
            imageName: "film",
            description: "A poignant drama about high school students facing bullying, societal pressure, and their intertwined fates. Heartbreaking yet hopeful.",
            review: "Emotionally powerful and beautifully acted. A modern masterpiece. 5/5 stars."
        ),
        Movie(
            title: "Nope",
            imageName: "film",
            description: "A suspenseful sci-fi horror about mysterious phenomena in the sky and the people who risk everything to capture it on camera.",
            review: "Thrilling, smart, and visually stunning. Jordan Peele delivers again. 5/5 stars."
        ),
        Movie(
            title: "Whiplash",
            imageName: "film",
            description: "An ambitious young drummer clashes with a ruthless music teacher, exploring obsession, perfection, and sacrifice in pursuit of greatness.",
            review: "Intense and electrifying. J.K. Simmons gives a career-defining performance. 5/5 stars."
        ),
        Movie(
            title: "Scott Pilgrim vs. The World",
            imageName: "film",
            description: "Scott Pilgrim must defeat his new girlfriend’s seven evil exes in a visually inventive, fast-paced romantic comedy. Fun, chaotic, and geeky.",
            review: "Stylish, hilarious, and endlessly fun. A true comic book come to life. 5/5 stars."
        )
    ]
}
