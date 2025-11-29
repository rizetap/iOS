//
//  SuperheroViewController.swift
//  Superhero
//
//  Created by Perizat Muratova on 08.12.2025.
//

import UIKit

class SuperheroViewController: UIViewController {
    
    // MARK: - UI Elements
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray6
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let randomizeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("🎲 Randomize Hero", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // MARK: - Properties
    private let networkService = NetworkService.shared
    private var currentSuperhero: Superhero?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
        // Fetch first superhero
        fetchRandomSuperhero()
    }
    
    // MARK: - Setup
    private func setupUI() {
        title = "Superhero Randomizer"
        view.backgroundColor = .systemBackground
        
        // Add views
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(heroImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(randomizeButton)
        contentView.addSubview(infoStackView)
        
        view.addSubview(loadingIndicator)
        
        // Button action
        randomizeButton.addTarget(self, action: #selector(randomizeButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Scroll view
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Content view
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Hero image
            heroImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            heroImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            heroImageView.widthAnchor.constraint(equalToConstant: 250),
            heroImageView.heightAnchor.constraint(equalToConstant: 300),
            
            // Name label
            nameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Full name label
            fullNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Randomize button
            randomizeButton.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            randomizeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            randomizeButton.widthAnchor.constraint(equalToConstant: 220),
            randomizeButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Info stack view
            infoStackView.topAnchor.constraint(equalTo: randomizeButton.bottomAnchor, constant: 30),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            // Loading indicator
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc private func randomizeButtonTapped() {
        fetchRandomSuperhero()
        
        // Button animation
        UIView.animate(withDuration: 0.1, animations: {
            self.randomizeButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.randomizeButton.transform = .identity
            }
        }
    }
    
    // MARK: - Networking
    private func fetchRandomSuperhero() {
        loadingIndicator.startAnimating()
        randomizeButton.isEnabled = false
        
        networkService.fetchRandomSuperhero { [weak self] result in
            DispatchQueue.main.async {
                self?.loadingIndicator.stopAnimating()
                self?.randomizeButton.isEnabled = true
                
                switch result {
                case .success(let superhero):
                    self?.currentSuperhero = superhero
                    self?.updateUI(with: superhero)
                    
                case .failure(let error):
                    self?.showError(error)
                }
            }
        }
    }
    
    // MARK: - UI Updates
    private func updateUI(with superhero: Superhero) {
        // Fade out animation
        UIView.animate(withDuration: 0.3, animations: {
            self.heroImageView.alpha = 0
            self.nameLabel.alpha = 0
            self.fullNameLabel.alpha = 0
            self.infoStackView.alpha = 0
        }) { _ in
            // Update content
            self.nameLabel.text = superhero.name
            self.fullNameLabel.text = superhero.biography.fullName
            
            // Clear previous info
            self.infoStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
            
            // Add new info sections (10+ attributes)
            self.addInfoSection(title: "Intelligence", value: "\(superhero.powerstats.intelligence ?? 0)")
            self.addInfoSection(title: "Strength", value: "\(superhero.powerstats.strength ?? 0)")
            self.addInfoSection(title: "Speed", value: "\(superhero.powerstats.speed ?? 0)")
            self.addInfoSection(title: "Durability", value: "\(superhero.powerstats.durability ?? 0)")
            self.addInfoSection(title: "Power", value: "\(superhero.powerstats.power ?? 0)")
            self.addInfoSection(title: "Combat", value: "\(superhero.powerstats.combat ?? 0)")
            self.addInfoSection(title: "Gender", value: superhero.appearance.gender ?? "Unknown")
            self.addInfoSection(title: "Race", value: superhero.appearance.race ?? "Unknown")
            self.addInfoSection(title: "Height", value: superhero.appearance.height.first ?? "Unknown")
            self.addInfoSection(title: "Weight", value: superhero.appearance.weight.first ?? "Unknown")
            self.addInfoSection(title: "Eye Color", value: superhero.appearance.eyeColor)
            self.addInfoSection(title: "Hair Color", value: superhero.appearance.hairColor)
            self.addInfoSection(title: "Publisher", value: superhero.biography.publisher ?? "Unknown")
            self.addInfoSection(title: "Alignment", value: superhero.biography.alignment.capitalized)
            self.addInfoSection(title: "Occupation", value: superhero.work.occupation)
            
            // Download and set image
            self.networkService.downloadImage(from: superhero.images.md) { image in
                DispatchQueue.main.async {
                    self.heroImageView.image = image
                    
                    // Fade in animation
                    UIView.animate(withDuration: 0.5) {
                        self.heroImageView.alpha = 1
                        self.nameLabel.alpha = 1
                        self.fullNameLabel.alpha = 1
                        self.infoStackView.alpha = 1
                    }
                }
            }
        }
    }
    
    private func addInfoSection(title: String, value: String) {
        let containerView = UIView()
        containerView.backgroundColor = .secondarySystemBackground
        containerView.layer.cornerRadius = 12
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textColor = .secondaryLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        valueLabel.numberOfLines = 0
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            valueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
        
        infoStackView.addArrangedSubview(containerView)
    }
    
    private func showError(_ error: NetworkError) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Try Again", style: .default) { _ in
            self.fetchRandomSuperhero()
        })
        present(alert, animated: true)
    }
}
