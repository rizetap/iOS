//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Perizat Muratova on 24.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
                    UIColor(red: 25/255, green: 0, blue: 30/255, alpha: 1).cgColor,
                    UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
                

        posterImage.layer.cornerRadius = 18
        posterImage.layer.masksToBounds = true
        posterImage.layer.borderWidth = 3
        posterImage.layer.borderColor = UIColor.orange.cgColor
                
                
        titleLabel.textColor = UIColor(red: 255/255, green: 140/255, blue: 0, alpha: 1)
        titleLabel.font = UIFont(name: "Papyrus", size: 24) ?? UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.text = "Halloween Movie Picker"
                
        rollButton.backgroundColor = UIColor(red: 150/255, green: 0, blue: 0, alpha: 1)
        rollButton.setTitle("Summon Movie", for: .normal)
        rollButton.setTitleColor(.white, for: .normal)
        rollButton.layer.cornerRadius = 14
        rollButton.layer.borderColor = UIColor.orange.cgColor
        rollButton.layer.borderWidth = 2
                
        showRandomMovie()
    }
    let movies = [
            ("fly", "The Fly"),
            ("christine", "Christine"),
            ("audition", "Audition"),
            ("baby", "Rosemary's Baby"),
            ("memento", "Memento"),
            ("nope", "Nope"),
            ("blue", "Perfect Blue"),
            ("shining", "The Shining"),
            ("substance", "The Substance"),
            ("pearl", "Pearl")
        ]
    @IBAction func buttonToRoll(_ sender: Any) {
                showRandomMovie()
    }
    
    func showRandomMovie() {
        guard let random = movies.randomElement() else { return }
        
        UIView.transition(with: posterImage, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    self.posterImage.image = UIImage(named: random.0)
                })

                UIView.transition(with: titleLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    self.titleLabel.text = random.1
                })
    }
}

