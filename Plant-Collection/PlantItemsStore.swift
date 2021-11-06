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
        let newPlant = PlantItem(typeOfPlant: "Orchid", nickname: "Groot", description: "The Orchidaceae are a diverse and widespread family of flowering plants, with blooms that are often colorful and fragrant", pot: "purple pot", waterRating: "1")
        
        
        let newPlant2 = PlantItem(typeOfPlant: "African Violet", nickname: "Purple", description: "Native to Tanzania", pot: "pink pot", waterRating: "1")
        
        let newPlant3 = PlantItem(typeOfPlant: "Air plant", nickname: "Air Jordan", description: "Tillandsia is a genus of around 650 species of evergreen, perennial flowering plants", pot: "blue pot", waterRating: "3")
        
        let newPlant4 = PlantItem(typeOfPlant: "Fern", nickname: "Christofern", description: "Class of nonflowering vascular plants that possess true roots, stems, and leaves.", pot: "green pot", waterRating: "2")
        
        let newPlant5 = PlantItem(typeOfPlant: "Succulent", nickname: "Fluffy", description: "In botany, succulent plants, are plants with parts that are thickened, fleshy, and engorged", pot: "pink sparkly pot", waterRating: "1")
        
        let newPlant6 = PlantItem(typeOfPlant: "Spider Plant", nickname: "Spiderman", description: "Chlorophytum comosum, usually called spider plant but also known as spider ivy.", pot: "butterfly pot", waterRating: "2")
        
        let newPlant7 = PlantItem(typeOfPlant: "Money Plant", nickname: "Bill", description: "Pachira aquatica is a tropical wetland tree in the mallow family.", pot: "glass pot", waterRating: "2")
        
        let newPlant8 = PlantItem(typeOfPlant: "Aloe Vera", nickname: "Sunny", description: "Aloe vera is a succulent plant species of the genus Aloe.", pot: "purple pot", waterRating: "1")
        
        let newPlant9 = PlantItem(typeOfPlant: "Bonsai", nickname: "Bonnie wood green", description: "A bonsai tree is a living tree or shrub which has been grown in a way which gives the impression of being a full-sized, mature tree.", pot: "ceramic pot", waterRating: "1")
        
        let newPlant10 = PlantItem(typeOfPlant: "Cactus", nickname: "Cactus Everdeen", description: "The word cactus describes a type of desert plant", pot: "yellow pot", waterRating: "1")
        
        let plantArray = [newPlant, newPlant2, newPlant3, newPlant4, newPlant5, newPlant6, newPlant7, newPlant8, newPlant9, newPlant10]
        
        // choose a random plant to add
        let randomPlant = plantArray.randomElement()!
        allPlantItems.append(randomPlant)
        
        return randomPlant
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
