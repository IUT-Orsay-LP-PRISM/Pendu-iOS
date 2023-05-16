//
//  MenuController.swift
//  Pendu-iOS
//
//  Created by Mathieu Morgat on 16/05/2023.
//

import UIKit

class MenuController: UIViewController {
    var nbrErreur = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        nbrErreur = 0
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var penduImg: UIImageView!
    @IBOutlet weak var triesLbl: UILabel!
    @IBOutlet weak var incrementBtn: UIButton!
    @IBAction func incrementAction(_ sender: Any) {
        nbrErreur = nbrErreur + 1;
        changeImg(nbr:nbrErreur);
        triesLeft(nbr:nbrErreur);
    }
    func changeImg(nbr:Int){
        if(nbr != 10){
            penduImg.image = UIImage(named: String(nbr+1)+"coup")
        }
        else{
            penduImg.image = UIImage(named: "pendu")
        }
    }
    
    func triesLeft(nbr:Int){
        let total = 10;
        let tries = total - nbr;
        if(tries > 0){
            triesLbl.text = "Tentatives restantes : " + String(tries);
        }
        else{
            triesLbl.text = "Aucunes tentatives restantes";
            incrementBtn.isEnabled = false;
            
        }
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
