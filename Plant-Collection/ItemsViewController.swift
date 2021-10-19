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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        // Set the tect on the cell
        let plant = plantItemsStore.allPlantItems[indexPath.row]
        
        cell.textLabel?.text = plant.typeOfPlant
        cell.detailTextLabel?.text = plant.nickname
        
        return cell
    }
}
