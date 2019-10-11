//
//  BreedsTableViewController.swift
//  DogObjC
//
//  Created by Austin Goetz on 10/10/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class BreedsTableViewController: UITableViewController {
    
    
    var breeds: [AMGBreeds] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AMGBreedsController.shared().fetchBreeds { (breeds) in
            DispatchQueue.main.async {
                self.breeds = breeds
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)
        
        let breed = breeds[indexPath.row]
        cell.textLabel?.text = breed.name
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let breed = breeds[indexPath.row]
        if breed.subBreed.count == 0 {
            self.performSegue(withIdentifier: "toImageView", sender: self)
        } else {
            self.performSegue(withIdentifier: "toSubBreedTVC", sender: self)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSubBreedTVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            guard let destinationVC = segue.destination as? SubBreedTableViewController else {return}
            let breedToSend = breeds[indexPath.row]
            destinationVC.breed = breedToSend
            destinationVC.subBreed = breedToSend.subBreed
            
        } else if segue.identifier == "toImageView" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            guard let destinationVC = segue.destination as? CollectionViewController else {return}
            let breedToSend = breeds[indexPath.row]
            destinationVC.breed = breedToSend
            
        }
    }
}


