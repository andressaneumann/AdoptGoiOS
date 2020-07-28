//
//  PetsViewController.swift
//  AdoptGo
//
//  Created by Andressa Neumann Silva on 27/07/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var amountOfAvailablePets: UILabel!
    @IBOutlet weak var petSearchBar: UISearchBar!
    
    let petList = PetDAO().returnPets()
    var filteredPetList:[Pet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        petSearchBar.delegate = self
        
        self.amountOfAvailablePets.text = updateLabelWithPetCount()
    }
    
    func updateLabelWithPetCount() -> String {
        return petList.count == 1 ? "1 disponível" : " \(petList.count) disponíveis"
    }
    
}

extension PetsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let petTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: PetTableViewCell.self), for: indexPath) as? PetTableViewCell else { return UITableViewCell()}
        
        let pet = petList[indexPath.row]
        
        petTableViewCell.configureCell(pet)
        petTableViewCell.layer.cornerRadius = 8
        
        return petTableViewCell
    }
}

extension PetsViewController: UISearchBarDelegate {
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        
//        filteredPetList = petList
//
//        if !searchText.isEmpty {
//            let petListFilter = NSPredicate(format: "name CONTAINS[c] %@", searchText)
//
//            let filteredList: Array<Pet> = (filteredPetList as NSArray).filtered(using: petListFilter) as! Array
//
//            filteredPetList = filteredList
//        }
//
//        tableView.reloadData()
//        
//    }
}

extension PetsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let petSelected = petList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "details") as! DetailViewController
        
        controller.petSelected = petSelected
        self.present(controller, animated: true, completion: nil)
    }
    
}


