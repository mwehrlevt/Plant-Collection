//
//  PlantItemsStore.swift
//  Plant-Collection
//
//  Created by Michelle on 10/19/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class PlantItemsStore {
    var allPlantItems = [PlantItem]()
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.plist")
    }()
    
    // for testing
    /*init() {
        for _ in 0..<5 {
            createItem()
        }
    }*/
    
    init() {
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let unarchiver = PropertyListDecoder()
            let items = try unarchiver.decode([PlantItem].self, from: data)
            allPlantItems = items
        } catch {
            print("Error reading in saved items: \(error)")
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(saveChanges),
                                       name: UIScene.didEnterBackgroundNotification,
                                       object: nil)
    }
    
    @discardableResult func createItem() -> PlantItem {
        let newPlant = PlantItem(typeOfPlant: "Orchid", nickname: "Groot", description: "The Orchidaceae are a diverse...", pot: "purple pot", waterRating: "1")
        
        allPlantItems.append(newPlant)
        return newPlant
    }
    
    func removeItem(_ item: PlantItem) {
        if let index = allPlantItems.firstIndex(of: item) {
            allPlantItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // get reference to object being moved so you can reinsert it
        let movedItem = allPlantItems[fromIndex]
        
        // remove item from array
        allPlantItems.remove(at: fromIndex)
        
        // insert item in array at new location
        allPlantItems.insert(movedItem, at: toIndex)
    }
    
    @objc func saveChanges() -> Bool {
        do{
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allPlantItems)
            try data.write(to: itemArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError{
            print("Error encoding allPlantItems: \(encodingError)")
            return false
        }
    }
}
