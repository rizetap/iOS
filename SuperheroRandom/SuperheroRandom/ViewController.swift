//
//  ViewController.swift
//  SuperheroRandom
//
//  Created by Perizat Muratova on 08.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var superheroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var statsContainerView: UIView!
    @IBOutlet weak var infoContainerView: UIView!
    @IBOutlet weak var randomizeButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Stats Labels
    private var intelligenceLabel: UILabel!
    private var strengthLabel: UILabel!
    private var speedLabel: UILabel!
    private var durabilityLabel: UILabel!
    private var powerLabel: UILabel!
    private var combatLabel: UILabel!
    
    // Info Labels
    private var genderLabel: UILabel!
    private var raceLabel: UILabel!
    private var birthPlaceLabel: UILabel!
    private var alignmentLabel: UILabel!
    
    // Current superhero
    private var currentSuperhero: Superhero?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadInitialData()
    }
    
    // MARK: - Setup
    private func setupUI() {
        title = "Superhero Randomizer"
        
        // Setup image view
        superheroImageView.layer.cornerRadius = 12
        superheroImageView.clipsToBounds = true
        
        // Setup button
        randomizeButton.layer.cornerRadius = 10
        randomizeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        // Create stats labels
        setupStatsContainer()
        
        // Create info labels
        setupInfoContainer()
    }
    
    private func setupStatsContainer() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        statsContainerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: statsContainerView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: statsContainerView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: statsContainerView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: statsContainerView.bottomAnchor, constant: -16)
        ])
        
        let titleLabel = createTitleLabel(text: "Power Stats")
        stackView.addArrangedSubview(titleLabel)
        
        intelligenceLabel = createStatLabel()
        strengthLabel = createStatLabel()
        speedLabel = createStatLabel()
        durabilityLabel = createStatLabel()
        powerLabel = createStatLabel()
        combatLabel = createStatLabel()
        
        stackView.addArrangedSubview(intelligenceLabel)
        stackView.addArrangedSubview(strengthLabel)
        stackView.addArrangedSubview(speedLabel)
        stackView.addArrangedSubview(durabilityLabel)
        stackView.addArrangedSubview(powerLabel)
        stackView.addArrangedSubview(combatLabel)
        
        statsContainerView.backgroundColor = UIColor.systemGray6
        statsContainerView.layer.cornerRadius = 12
    }
    
    private func setupInfoContainer() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        infoContainerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: infoContainerView.bottomAnchor, constant: -16)
        ])
        
        let titleLabel = createTitleLabel(text: "Information")
        stackView.addArrangedSubview(titleLabel)
        
        genderLabel = createInfoLabel()
        raceLabel = createInfoLabel()
        birthPlaceLabel = createInfoLabel()
        alignmentLabel = createInfoLabel()
        
        stackView.addArrangedSubview(genderLabel)
        stackView.addArrangedSubview(raceLabel)
        stackView.addArrangedSubview(birthPlaceLabel)
        stackView.addArrangedSubview(alignmentLabel)
        
        infoContainerView.backgroundColor = UIColor.systemGray6
        infoContainerView.layer.cornerRadius = 12
    }
    
    private func createTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }
    
    private func createStatLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }
    
    private func createInfoLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }
    
    // MARK: - Data Loading
    private func loadInitialData() {
        showLoading(true)
        
        // First, fetch all superheroes
        NetworkManager.shared.fetchAllSuperheroes { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(_):
                // Check if there's a saved superhero
                if let lastId = UserDefaultsManager.shared.getLastSuperheroId() {
                    self.loadSuperhero(byId: lastId)
                } else {
                    self.loadRandomSuperhero()
                }
            case .failure(let error):
                self.showLoading(false)
                self.showError(error)
            }
        }
    }
    
    private func loadSuperhero(byId id: Int) {
        showLoading(true)
        
        NetworkManager.shared.fetchSuperhero(byId: id) { [weak self] result in
            guard let self = self else { return }
            self.showLoading(false)
            
            switch result {
            case .success(let superhero):
                self.displaySuperhero(superhero)
            case .failure(let error):
                self.showError(error)
                self.loadRandomSuperhero()
            }
        }
    }
    
    private func loadRandomSuperhero() {
        guard let superhero = NetworkManager.shared.getRandomSuperhero() else {
            showError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No superheroes available"]))
            return
        }
        
        showLoading(false)
        displaySuperhero(superhero)
    }
    
    // MARK: - Display Superhero
    private func displaySuperhero(_ superhero: Superhero) {
        currentSuperhero = superhero
        
        // Animate transition
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
            // Load image
            if let url = URL(string: superhero.images.md) {
                self.superheroImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "person.circle.fill"))
            }
            
            // Basic info
            self.nameLabel.text = superhero.name
            self.fullNameLabel.text = superhero.biography.fullName
            
            // Stats (10+ attributes)
            self.intelligenceLabel.text = "🧠 Intelligence: \(superhero.powerstats.intelligence)"
            self.strengthLabel.text = "💪 Strength: \(superhero.powerstats.strength)"
            self.speedLabel.text = "⚡ Speed: \(superhero.powerstats.speed)"
            self.durabilityLabel.text = "🛡️ Durability: \(superhero.powerstats.durability)"
            self.powerLabel.text = "⭐ Power: \(superhero.powerstats.power)"
            self.combatLabel.text = "⚔️ Combat: \(superhero.powerstats.combat)"
            
            // Additional info
            self.genderLabel.text = "👤 Gender: \(superhero.appearance.gender)"
            self.raceLabel.text = "🧬 Race: \(superhero.appearance.race ?? "Unknown")"
            self.birthPlaceLabel.text = "📍 Birth Place: \(superhero.biography.placeOfBirth)"
            self.alignmentLabel.text = "⚖️ Alignment: \(superhero.biography.alignment.capitalized)"
        })
        
        // Save to UserDefaults
        UserDefaultsManager.shared.saveLastSuperhero(id: superhero.id)
    }
    
    // MARK: - Actions
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        // Add button animation
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
        
        loadRandomSuperhero()
    }
    
    // MARK: - Helper Methods
    private func showLoading(_ show: Bool) {
        DispatchQueue.main.async {
            if show {
                self.activityIndicator.startAnimating()
                self.randomizeButton.isEnabled = false
            } else {
                self.activityIndicator.stopAnimating()
                self.randomizeButton.isEnabled = true
            }
        }
    }
    
    private func showError(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

