//
//  BreedTableViewController.swift
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class BreedTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SRHBreedController.shared().fetchBreed { (success) in
            if success {
                if success {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }else{
                    print("it's a trap")
                }
            }
        }
    }
    
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SRHBreedController.shared().breed.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedCell", for: indexPath)

        let breed = SRHBreedController.shared().breed[indexPath.row]
        cell.textLabel?.text = breed.name
        return cell
    }

    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = SRHBreedController.shared().breed[indexPath.row]
        guard let subbreed = breed.subbreed else {return}
        if subbreed.isEmpty {
            self.performSegue(withIdentifier: "toPhotos", sender: nil)
        }else {
            self.performSegue(withIdentifier: "toSubbreads", sender: nil)
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
        if segue.identifier == "toPhotos" {
            guard let destination = segue.destination as? ImageCollectionViewController else {return}
            let breed = SRHBreedController.shared().breed[indexPath.row]
            destination.breed = breed
            
            
        } else {
            guard let destination = segue.destination as? SubBreedTableViewController else {return}
            let subbreed = SRHBreedController.shared().breed[indexPath.row].subbreed
            destination.subbreed = subbreed!
            
        }
        
        
    }
}
