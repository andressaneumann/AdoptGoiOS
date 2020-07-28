//
//  DetailViewController.swift
//  AdoptGo
//
//  Created by Andressa Neumann Silva on 27/07/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petBreedLabel: UILabel!
    @IBOutlet weak var petGenderLabel: UILabel!
    @IBOutlet weak var petImageView: UIImageView!
    
    var petSelected: Pet? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let pet = petSelected {
            self.petNameLabel.text = pet.name
            self.petBreedLabel.text = pet.breed
            self.petGenderLabel.text = pet.gender.rawValue
            self.petImageView.image = UIImage(named: pet.imagePath)
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }

}
