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
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> PlantItem {
        let newPlant = PlantItem(typeOfPlant: "Orchid", nickname: "Groot", description: "The Orchidaceae are a diverse...", pot: "purple pot", waterRating: 1)
        
        allPlantItems.append(newPlant)
        return newPlant
    }
}
