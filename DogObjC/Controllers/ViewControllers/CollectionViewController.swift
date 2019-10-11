//
//  CollectionViewController.swift
//  DogObjC
//
//  Created by Austin Goetz on 10/10/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "newNameCell"


class CollectionViewController: UICollectionViewController {
    
    var breed: AMGBreeds?
    var subBreeds: AMGSubBreed?
    var imageURLs: [Any] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.fetchImageURL()
        
        
    }
    
    // MARK: UICollectionViewDataSource
    
    numberofs
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
//        if subBreeds != nil {
//            guard let subBreed = subBreeds else {return 0}
//            return subBreed.imageURL.count
//        } else {
//            guard let breed = breed else {return 0}
//            return breed.imageURL.count
//        }
//    }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? SaucyCollectionViewCell else {return UICollectionViewCell()}
        let imageURL = imageURLs[indexPath.row] as! String
        AMGBreedsController.shared().fetchImageData(fromURL: imageURL) { (pizzaSauceee) in
            if let extraSaucySauce = pizzaSauceee {
                let newImage = UIImage(data: extraSaucySauce)
                DispatchQueue.main.async {
                    cell.imageViewHoldTheSauce.image = newImage
                    self.collectionView.reloadData()
                
            }
            }
        }
        
        
        return cell
    }
    
    func fetchImageURL() {
        if subBreeds != nil {
            guard let subBreed = subBreeds, let breed = breed else {return}
            AMGBreedsController.shared().fetchSubBreedImage(subBreed, breed: breed) { (imageURLs) in
                DispatchQueue.main.async {
                    self.imageURLs = imageURLs
                    self.collectionView.reloadData()
                }
            }
        } else {
            guard let breed = breed else {return}
            AMGBreedsController.shared().fetchBreedImageURL(breed) { (imageURLs) in
                DispatchQueue.main.async {
                    self.imageURLs = imageURLs
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

