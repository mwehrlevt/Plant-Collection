//
//  DetailViewController.swift
//  Plant-Collection
//
//  Created by Michelle on 10/30/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var typeOfPlantField: UITextField!
    
    @IBOutlet var nicknameField: UITextField!
    
    @IBOutlet var potField: UITextField!
    
    @IBOutlet var waterRatingField: UITextField!
    
    @IBOutlet var descriptionField: UITextField!
    
    var plantItem: PlantItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        typeOfPlantField.text = plantItem.typeOfPlant
        nicknameField.text = plantItem.nickname
        potField.text = plantItem.pot
        waterRatingField.text = plantItem.waterRating
        descriptionField.text = plantItem.description
    }
}
