//
//  PetCollectionViewCell.swift
//  AdoptGo
//
//  Created by Andressa Neumann Silva on 27/07/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petBreed: UILabel!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petGender: UILabel!
    
    func configureCell(_ pet: Pet) {
        petImage.image = UIImage(named: pet.imagePath)
        petBreed.text = pet.breed
        petName.text = pet.name
        petGender.text = pet.gender.rawValue
    }
}
