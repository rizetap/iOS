//
//  ViewController.swift
//  DiceeApp
//
//  Created by Perizat Muratova on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1Image: UIImageView!
    @IBOutlet weak var dice2Image: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func rollButtonAction(_ sender: Any) {
        let rolledNumber1 = Int.random(in: 1...6)
        let rolledNumber2 = Int.random(in: 1...6)
        
        dice1Image.image = UIImage(named: "dice\(rolledNumber1)")
        dice2Image.image = UIImage(named: "dice\(rolledNumber2)")
    }
    
}

