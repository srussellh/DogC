//
//  SubBreedTableViewController.swift
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class SubBreedTableViewController: UITableViewController {

    var subbreed: [SRHSubBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subbreed.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubBreedCell", for: indexPath)
        
        let subbreed = self.subbreed[indexPath.row]
        cell.textLabel?.text = subbreed.name
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
    }
}
