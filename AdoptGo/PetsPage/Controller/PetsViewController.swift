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
    
    let petList = PetDAO().returnPets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        //self.tableView.rowHeight = 150.0
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


