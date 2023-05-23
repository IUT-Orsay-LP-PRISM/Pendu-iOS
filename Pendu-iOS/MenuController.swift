//
//  MenuController.swift
//  Pendu-iOS
//
//  Created by Mathieu Morgat on 16/05/2023.
//

import UIKit

class MenuController: UIViewController {
    var nbrErreur = 0
    var counterMinutes = 0
    var counterSeconds = 0
    var counterMiliseconds = 0
    var countDirection = "Up"
    var maxCounter = 20
    var counterTimer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nbrErreur = 0
        if(countDirection == "Down"){
            counterSeconds = maxCounter;
        }
        else{
            counterSeconds = 0;
        }
        counterLbl.text = String(counterSeconds);
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var penduImg: UIImageView!
    @IBOutlet weak var triesLbl: UILabel!
    @IBOutlet weak var incrementBtn: UIButton!
    @IBAction func incrementAction(_ sender: Any) {
        nbrErreur = nbrErreur + 1;
        changeImg(nbr:nbrErreur);
        triesLeft(nbr:nbrErreur);
    }
    
    func startTimer(){
        counterTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSecondsLblCounter), userInfo: nil, repeats: true)
    }
    
    func changeImg(nbr:Int){
        if(counterTimer == nil){
            startTimer();
        }
        if(nbr != 10){
            penduImg.image = UIImage(named: String(nbr+1)+"coup");
        }
        else{
            penduImg.image = UIImage(named: "pendu");
            endGame();
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
    
    func timeIsOut(){
        //Ends the game when the timer runs out
        print("Timer ended")
        endGame();
    }
    
    func endGame(){
        print("Game Ended");
        counterTimer?.invalidate();
    }
    
    @objc func updateSecondsLblCounter() {
        //example functionality
        if(countDirection == "Up"){
            counterSeconds += 1;
            counterLbl.text = String(counterSeconds);
        }
        else if(countDirection == "Down"){
            if(counterSeconds > 0){
                counterSeconds -= 1;
                counterLbl.text = String(counterSeconds);
            }
            else{
                timeIsOut();
                return;
            }
        }
        else{
            print("Bad value for var countDirection");
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
