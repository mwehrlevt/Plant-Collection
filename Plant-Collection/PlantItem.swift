//
//  PlantItem.swift
//  Plant-Collection
//
//  Created by Michelle on 10/19/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class PlantItem: Equatable, Codable {
    var typeOfPlant: String
    var nickname: String
    var description: String
    var pot: String
    var waterRating: String
    
    init(typeOfPlant: String, nickname: String, description: String, pot: String, waterRating: String) {
        self.typeOfPlant = typeOfPlant
        self.nickname = nickname
        self.description = description
        self.pot = pot
        self.waterRating = waterRating
    }
    
    static func ==(lhs: PlantItem, rhs: PlantItem) -> Bool {
        return lhs.typeOfPlant == rhs.typeOfPlant && lhs.description == rhs.description && lhs.nickname == rhs.nickname && lhs.pot == rhs.pot && lhs.waterRating == rhs.waterRating
    }
}
