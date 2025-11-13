//
//  FavoriteItem.swift
//  Favorita
//
//  Created by Perizat Muratova on 29.11.2025.
//

import UIKit

struct FavoriteItem {
    let title: String
    let subtitle: String
    let review: String
    let imageName: String
    
    init(title: String, subtitle: String, review: String, imageName: String) {
        self.title = title
        self.subtitle = subtitle
        self.review = review
        self.imageName = imageName
    }
}

// MARK: - Sample Data

struct FavoritesData {
    
    // Section 0: Movies
    static let movies: [FavoriteItem] = [
        FavoriteItem(title: "The Fly", subtitle: "Dir. David Cronenberg, 1986", review: "A gruesome, brilliant body-horror remake with surreal practical effects and a haunting performance.", imageName: "the_fly"),
            FavoriteItem(title: "Christine", subtitle: "Dir. John Carpenter, 1983", review: "A slow-burn horror with great atmosphere and an eerie car-as-character concept.", imageName: "christine_movie"),
            FavoriteItem(title: "What We Do in the Shadows", subtitle: "Dir. Taika Waititi, 2014", review: "Hilarious mockumentary with perfect deadpan and lovable vampires.", imageName: "shadows"),
            FavoriteItem(title: "Audition", subtitle: "Dir. Takashi Miike, 1999", review: "A tense, disturbing psychological horror with incredible tension and unforgettable scenes.", imageName: "audition"),
            FavoriteItem(title: "Look Back", subtitle: "Anime Short, 2024", review: "A beautifully animated, emotional story exploring friendship and the passage of time.", imageName: "look_back")

    ]
    
    // Section 1: Music
    static let music: [FavoriteItem] = [
        FavoriteItem(title: "Дайте танк", subtitle: "Artist/Album, Year", review: "Energetic, unique sound that really resonates with me.", imageName: "daite_tank"),
            FavoriteItem(title: "Свидание", subtitle: "Artist/Album, Year", review: "Beautiful melodies and emotional depth — always a favorite.", imageName: "svidanie"),
            FavoriteItem(title: "TV Girl", subtitle: "Artist/Album, Year", review: "Catchy indie-pop with clever lyrics and a nostalgic feel.", imageName: "tv_girl"),
            FavoriteItem(title: "Mitski", subtitle: "Artist/Album, Year", review: "Powerful vocals and emotional songwriting — truly captivating.", imageName: "mitski"),
            FavoriteItem(title: "Blood Orange", subtitle: "Artist/Album, Year", review: "Smooth, eclectic sound with incredible production.", imageName: "blood_orange")

    ]
    
    // Section 2: Books
    static let books: [FavoriteItem] = [
        FavoriteItem(title: "The Invisible Women", subtitle: "Author Name, Year", review: "A fascinating exploration of hidden lives and secrets.", imageName: "invisible_women"),
          FavoriteItem(title: "Myth About Beauty", subtitle: "Author Name, Year", review: "Challenges traditional ideas of beauty and perception.", imageName: "myth"),
          FavoriteItem(title: "Misery", subtitle: "Stephen King, 1987", review: "Intense psychological horror — terrifying and brilliantly written.", imageName: "misery"),
          FavoriteItem(title: "Christine", subtitle: "Stephen King, 1983", review: "Classic horror about obsession and a possessed car — unforgettable.", imageName: "christine_book"),
          FavoriteItem(title: "Guts", subtitle: "Chuck Palahniuk, 2004", review: "Short stories that shock, entertain, and provoke thought.", imageName: "guts")

    ]
    
    // Section 3: University Courses
    static let courses: [FavoriteItem] = [
        FavoriteItem(
            title: "Data Structures & Algorithms",
            subtitle: "CS 201 • Computer Science",
            review: "This course fundamentally changed how I think about problem-solving. Learning to analyze time complexity and implement efficient algorithms provides a strong foundation for all programming work.",
            imageName: "graduationcap"
        ),
        FavoriteItem(
            title: "Mobile Application Development",
            subtitle: "CS 407 • Computer Science",
            review: "Building real iOS and Android apps from scratch was incredibly rewarding. The hands-on projects taught me UI/UX principles, API integration, and the complete app development lifecycle.",
            imageName: "graduationcap"
        ),
        FavoriteItem(
            title: "Database Systems",
            subtitle: "CS 340 • Computer Science",
            review: "Understanding relational databases, SQL optimization, and transaction management is crucial for backend development. The practical projects involving database design were particularly valuable.",
            imageName: "graduationcap"
        ),
        FavoriteItem(
            title: "Artificial Intelligence",
            subtitle: "CS 445 • Computer Science",
            review: "Exploring machine learning algorithms, neural networks, and AI applications opened up exciting possibilities. The course balanced theory with practical implementations using Python and TensorFlow.",
            imageName: "graduationcap"
        ),
        FavoriteItem(
            title: "Software Engineering",
            subtitle: "CS 350 • Computer Science",
            review: "Learning about the software development lifecycle, agile methodologies, and working in teams on a semester-long project prepared me for real-world development scenarios.",
            imageName: "graduationcap"
        )
    ]
    
    // Section titles
    static let sectionTitles = [
        "🎬 Favorite Movies",
        "🎵 Favorite Music",
        "📚 Favorite Books",
        "🎓 University Courses"
    ]
    
    // Get items for section
    static func items(for section: Int) -> [FavoriteItem] {
        switch section {
        case 0: return movies
        case 1: return music
        case 2: return books
        case 3: return courses
        default: return []
        }
    }
}
