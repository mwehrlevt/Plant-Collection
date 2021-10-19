//
//  PlantItem.swift
//  Plant-Collection
//
//  Created by Michelle on 10/19/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class PlantItem {
    var typeOfPlant: String
    var nickname: String
    var description: String
    var pot: String
    var waterRating: Int
    
    init(typeOfPlant: String, nickname: String, description: String, pot: String, waterRating: Int) {
        self.typeOfPlant = typeOfPlant
        self.nickname = nickname
        self.description = description
        self.pot = pot
        self.waterRating = waterRating
    }
}
