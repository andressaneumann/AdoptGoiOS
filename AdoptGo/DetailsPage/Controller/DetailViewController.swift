//
//  DetailViewController.swift
//  AdoptGo
//
//  Created by Andressa Neumann Silva on 27/07/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petBreedLabel: UILabel!
    @IBOutlet weak var petGenderLabel: UILabel!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petDescriptionLabel: UILabel!
    
    @IBOutlet weak var circleContainer: UIView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var petSizeLabel: UILabel!
    var petSelected: Pet? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCircleContainer()

        if let pet = petSelected {
            self.petNameLabel.text = pet.name
            self.petBreedLabel.text = pet.breed
            self.petGenderLabel.text = pet.gender.rawValue
            self.petImageView.image = UIImage(named: pet.imagePath)
            self.petDescriptionLabel.text = pet.description
            self.petSizeLabel.text = pet.size.rawValue
        }
    }
    
    func configureCircleContainer() {
        self.circleContainer.layer.cornerRadius = self.circleContainer.frame.size.width / 2
        self.circleContainer.clipsToBounds = true
        
        self.circleContainer.layer.borderWidth = 1
        self.circleContainer.layer.borderColor = UIColor(red:219/255, green:219/255, blue:219/255, alpha: 1).cgColor
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 15)
    }
}
