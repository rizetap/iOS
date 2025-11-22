//
//  Book.swift
//  FavoritaManager
//
//  Created by Perizat Muratova on 08.12.2025.
//

import UIKit

struct Book {
    let title: String
    let imageName: String
    let description: String
    let review: String
    
    // Sample data
    static let sampleBooks: [Book] = [
        Book(
            title: "Misery",
            imageName: "book",
            description: "Stephen King's thriller about a famous author held captive by an obsessed fan. A gripping story of terror, obsession, and survival.",
            review: "Intense and suspenseful. King's best psychological horror. 5/5 stars."
        ),
        Book(
            title: "Christine",
            imageName: "book",
            description: "Stephen King's novel about a possessed car that drives its owner to obsession and violence. A classic horror tale of inanimate evil.",
            review: "Creepy and unforgettable. Makes you think twice about old cars. 5/5 stars."
        ),
        Book(
            title: "The Green Mile",
            imageName: "book",
            description: "Stephen King's supernatural drama following death row guards and an inmate with miraculous healing powers. Emotional, dark, and unforgettable.",
            review: "Heartbreaking and powerful. A story of compassion and justice. 5/5 stars."
        ),
        Book(
            title: "Guts",
            imageName: "book",
            description: "Raina Telgemeier's graphic memoir about growing up with medical challenges and learning to overcome fear. Honest and relatable storytelling.",
            review: "Funny, touching, and inspirational. Perfect for young readers. 5/5 stars."
        ),
        Book(
            title: "Invisible Women",
            imageName: "book",
            description: "Caroline Criado Perez explores the gender data gap and how women are often excluded from research, design, and policy-making.",
            review: "Eye-opening and well-researched. Makes you rethink everyday life. 5/5 stars."
        ),
        Book(
            title: "The Beauty Myth",
            imageName: "book",
            description: "Naomi Wolf's classic feminist critique of societal pressures on women to achieve unattainable beauty standards.",
            review: "Insightful and thought-provoking. A must-read for understanding gender dynamics. 5/5 stars."
        ),
        Book(
            title: "Lord of the Flies",
            imageName: "book",
            description: "William Golding's novel about a group of boys stranded on an island who descend into savagery. A chilling study of human nature.",
            review: "Dark, disturbing, and brilliant. A timeless allegory about society and morality. 5/5 stars."
        ),
        Book(
            title: "The Hunger Games",
            imageName: "book",
            description: "Suzanne Collins' dystopian series opener about Katniss Everdeen fighting for survival in a televised death match. Adventure, strategy, and rebellion.",
            review: "Thrilling and addictive. Katniss is an unforgettable heroine. 5/5 stars."
        ),
        Book(
            title: "All Tomorrows",
            imageName: "book",
            description: "C. M. Kosemen's speculative future history exploring humanity's evolution over millions of years across the cosmos. Fascinating and imaginative.",
            review: "Mind-blowing and creative. Makes you think about the long-term future of humanity. 5/5 stars."
        ),
        Book(
            title: "IT",
            imageName: "book",
            description: "Stephen King's epic horror about a group of friends confronting a shape-shifting evil that terrorizes their town over decades.",
            review: "Terrifying and deeply emotional. One of King's most iconic works. 5/5 stars."
        )
    ]
}
