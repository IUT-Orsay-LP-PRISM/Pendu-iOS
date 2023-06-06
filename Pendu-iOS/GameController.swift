//
//  GameController.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 06/06/2023.
//

import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var selectDifficulty: UISegmentedControl!
    @IBOutlet weak var selectTime: UISegmentedControl!
    @IBOutlet weak var commencer: UIButton!
    
    
    @IBAction func commencerr(_ sender: UISegmentedControl) {
        
        var selectedDiff = selectDifficulty.selectedSegmentIndex;
        var selectedTime = selectTime.selectedSegmentIndex;
        
        switch selectedDiff{
                    case 0:
                    print("Moyen")
                break;
                    case 1:
                    print("Difficile")
                break;
            default:
            print("erreur")
    }
        switch selectedTime{
                    case 0:
                    print("30 SEC")
                break;
                    case 1:
                    print("90 SEC")
                break;
                    case 2:
                    print("infini")
                break;
            default:
            print("erreur")
    }
}

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
