//
//  DetailViewController.swift
//  Plant-Collection
//
//  Created by Michelle on 10/30/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var typeOfPlantField: UITextField!
    
    @IBOutlet var nicknameField: UITextField!
    
    @IBOutlet var potField: UITextField!
    
    @IBOutlet var waterRatingField: UITextField!
    
    @IBOutlet var descriptionField: UITextField!
    
    var plantItem: PlantItem! {
        didSet {
            navigationItem.title = plantItem.typeOfPlant
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        typeOfPlantField.text = plantItem.typeOfPlant
        nicknameField.text = plantItem.nickname
        potField.text = plantItem.pot
        waterRatingField.text = plantItem.waterRating
        descriptionField.text = plantItem.description
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        plantItem.typeOfPlant = typeOfPlantField.text ?? ""
        plantItem.nickname = nicknameField.text ?? ""
        plantItem.pot = potField.text ?? ""
        plantItem.waterRating = waterRatingField.text ?? ""
        plantItem.description = descriptionField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func trashItem(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Are you sure you want to delete this item", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel Trashing Item")
        }
        
        alertController.addAction(cancelAction)
        
        let confirmAction = UIAlertAction(title: "Yes", style: .default) { _ in
            print("Deleting item")
            PlantItemsStore().removeItem(self.plantItem)
            
            self.navigationController?.popViewController(animated: true)
            
        }
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
