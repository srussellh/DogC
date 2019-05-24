//
//  ImageCollectionViewController.swift
//  DogsC
//
//  Created by Bobba Kadush on 5/23/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DogImage"

class ImageCollectionViewController: UICollectionViewController {
    
    
    var theBreed: String?
    var breed: SRHBreed?
    var subBreed: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let breed = breed else {return}
        SRHBreedController.shared().fetchImageBreed(breed) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        // if from BreedView return Breed.imageURLs.count
        //Else (you are from subbreedview) return subBreed.imageURLs.count
        return breed?.imageURLs?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        guard let breed = breed else {return UICollectionViewCell()}
        SRHBreedController.shared().fetchImage(breed) { (image) in
            DispatchQueue.main.async {
                cell.imageDisplay.image = image
            }
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


}
