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

    var difTest = ""
    var difTime = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let selectedDiff = selectDifficulty.selectedSegmentIndex;
        let selectedTime = selectTime.selectedSegmentIndex;

         switch selectedDiff{
            case 0:
                difTest = "moyen"
                break;
            case 1:
                difTest = "difficile"
                break;
            default:
                difTest = "moyen"
         }
         switch selectedTime {
            case 0:
                difTime = "30"
                break;
            case 1:
                difTime = "90"
                break;
            case 2:
                difTime = "infini"
                break;
            default:
                difTime = "infini"
         }
        
        if segue.identifier == "DePersoVersJeu" {
            let destinationVC = segue.destination as! JeuController
            destinationVC.customSettings.updateValue(difTest, forKey: "difficulty")
            destinationVC.customSettings.updateValue(difTime, forKey: "time")
         }
    }
    
}
