//
//  Course.swift
//  FavoritaManager
//
//  Created by Perizat Muratova on 08.12.2025.
//

import UIKit

struct Course {
    let title: String
    let imageName: String
    let description: String
    let review: String
    
    // Sample data
    static let sampleCourses: [Course] = [
        Course(
            title: "CS50: Introduction to Computer Science",
            imageName: "graduationcap",
            description: "Harvard's renowned introductory computer science course taught by David Malan. Covers fundamental concepts including algorithms, data structures, web development, and multiple programming languages. Known for its engaging lectures and challenging problem sets.",
            review: "The best intro to CS course available. David Malan is an incredible teacher and the problem sets are challenging but rewarding. Changed my career path! 5/5 stars."
        ),
        Course(
            title: "Machine Learning - Stanford",
            imageName: "graduationcap",
            description: "Andrew Ng's comprehensive course covering supervised learning, unsupervised learning, neural networks, and best practices in machine learning. The course that launched thousands of ML careers with clear explanations of complex concepts.",
            review: "Andrew Ng makes ML accessible to everyone. Clear explanations, great examples, and practical assignments. The foundation for my AI career. 5/5 stars."
        ),
        Course(
            title: "iOS App Development with Swift",
            imageName: "graduationcap",
            description: "Comprehensive course covering iOS development from basics to advanced topics. Learn UIKit, SwiftUI, Auto Layout, networking, and app architecture. Build real-world apps and publish to the App Store.",
            review: "Everything you need to become an iOS developer. Great progression from beginner to advanced. The projects are practical and fun. 5/5 stars."
        ),
        Course(
            title: "The Complete Web Developer Bootcamp",
            imageName: "graduationcap",
            description: "Full-stack web development covering HTML, CSS, JavaScript, Node.js, React, and databases. Build 16+ projects including real-world web applications. Perfect for aspiring web developers at any level.",
            review: "Incredibly comprehensive and well-structured. Angela Yu is an amazing instructor. Went from zero to building full-stack apps. 5/5 stars."
        ),
        Course(
            title: "Data Structures and Algorithms",
            imageName: "graduationcap",
            description: "Master essential data structures like arrays, linked lists, trees, and graphs. Learn algorithm design, analysis, and optimization. Critical for technical interviews and building efficient software.",
            review: "Challenging but essential knowledge for any serious programmer. The visualizations really help understanding. Aced my coding interviews! 5/5 stars."
        ),
        Course(
            title: "AWS Certified Solutions Architect",
            imageName: "graduationcap",
            description: "Comprehensive AWS certification preparation covering cloud architecture, security, databases, networking, and best practices. Learn to design scalable, reliable systems on Amazon Web Services.",
            review: "Excellent preparation for the certification. Clear explanations of AWS services and hands-on labs. Got certified on first try! 5/5 stars."
        ),
        Course(
            title: "Python for Data Science",
            imageName: "graduationcap",
            description: "Learn Python programming focused on data analysis and visualization. Covers NumPy, Pandas, Matplotlib, and Scikit-learn. Work with real datasets and build data-driven applications.",
            review: "Perfect balance of theory and practice. The Jupyter notebooks are excellent and the projects use real data. Essential for data careers. 5/5 stars."
        ),
        Course(
            title: "Digital Marketing Masterclass",
            imageName: "graduationcap",
            description: "Complete guide to digital marketing including SEO, social media marketing, email campaigns, Google Ads, and analytics. Learn to create effective marketing strategies and measure ROI.",
            review: "Incredibly practical course. Immediately applied the strategies to my business and saw results. Phil is an engaging teacher. 5/5 stars."
        ),
        Course(
            title: "UI/UX Design Bootcamp",
            imageName: "graduationcap",
            description: "Master user interface and user experience design. Learn Figma, design thinking, prototyping, user research, and design systems. Create beautiful, functional interfaces users love.",
            review: "Transformed how I think about design. The projects build a strong portfolio and the feedback is invaluable. Now designing professionally! 5/5 stars."
        ),
        Course(
            title: "Introduction to Cybersecurity",
            imageName: "graduationcap",
            description: "Foundational course covering network security, cryptography, ethical hacking, and security best practices. Learn to identify vulnerabilities and protect systems from attacks.",
            review: "Eye-opening course about modern security threats. Hands-on labs make concepts real. Essential knowledge in today's digital world. 5/5 stars."
        )
    ]
}
