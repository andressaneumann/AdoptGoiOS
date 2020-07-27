//
//  FirstViewController.swift
//  AdoptGo
//
//  Created by Andressa Neumann Silva on 20/07/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let petList = PetDAO().returnPets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let petCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PetCollectionViewCell.self), for: indexPath) as? PetCollectionViewCell else { return UICollectionViewCell()}
        
        let pet = petList[indexPath.item]
        petCell.configureCell(pet)
        
        petCell.layer.cornerRadius = 10
        
        return petCell
    }
}

