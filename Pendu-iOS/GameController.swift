//
//  GameController.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 06/06/2023.
//

import UIKit
import CoreData

class GameController: UIViewController {
    
    @IBOutlet weak var selectDifficulty: UISegmentedControl!
    @IBOutlet weak var selectTime: UISegmentedControl!

    var difTest = "Facile"
    var difTime = "90 SEC"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "DePersoVersJeu" {
            let destinationVC = segue.destination as! JeuController
            destinationVC.customSettings.updateValue(difTest, forKey: "difficulty")
            destinationVC.customSettings.updateValue(difTime, forKey: "time")
         }
    }
    
}
