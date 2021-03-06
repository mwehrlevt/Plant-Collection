//
//  ItemsViewController.swift
//  Plant-Collection
//
//  Created by Michelle on 10/19/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var plantItemsStore: PlantItemsStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        // create a new item and add it to the plant store
        let newPlantItem = plantItemsStore.createItem()
        
        // figure out where that item is in the array
        if let index = plantItemsStore.allPlantItems.firstIndex(of: newPlantItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // insert into new row in table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantItemsStore.allPlantItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        // Set the text on the cell
        let plant = plantItemsStore.allPlantItems[indexPath.row]
        
        // configure the cell with the item
        cell.typeOfPlantLabel.text = plant.typeOfPlant
        cell.nicknameLabel.text = plant.nickname
        cell.potLabel.text = plant.pot
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // if the table view is asking to commit a delete
        if editingStyle == .delete {
            let item = plantItemsStore.allPlantItems[indexPath.row]
            
            // remove the plant
            plantItemsStore.removeItem(item)
            
            // remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // update the model
        plantItemsStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the triggered seque is the "showItem" segue
        switch segue.identifier {
        case "showItem":
            // figure out which row was tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // get the item associated with the row and pass it
                let plantItem = plantItemsStore.allPlantItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.plantItem = plantItem
                detailViewController.plantItemsStore = plantItemsStore
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}
