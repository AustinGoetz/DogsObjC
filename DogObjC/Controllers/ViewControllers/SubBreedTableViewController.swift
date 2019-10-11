//
//  SubBreedTableViewController.swift
//  DogObjC
//
//  Created by Austin Goetz on 10/10/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class SubBreedTableViewController: UITableViewController {

    var breed: AMGBreeds?
    
    var subBreed: [AMGSubBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
           
        }

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subBreed.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "subBreedCell", for: indexPath)
 
        let subBreed = self.subBreed[indexPath.row]
        cell.textLabel?.text = subBreed.name

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageView" {
            guard let indexPath = tableView.indexPathForSelectedRow, let breed = breed else {return}
            guard let destinationVC = segue.destination as? CollectionViewController else {return}
            let breedToSend = breed.subBreed[indexPath.row]
            destinationVC.subBreeds = breedToSend
            
        }
    }

}
