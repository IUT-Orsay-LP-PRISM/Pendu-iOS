//
//  JeuController.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 16/05/2023.
//

import UIKit

class JeuController: UIViewController {
    @IBOutlet weak var penduImg: UIImageView!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var textAction: UILabel!
    @IBOutlet weak var counterLbl: UILabel!
    
    var counterMinutes = 0
    var counterSeconds = 0
    var counterMiliseconds = 0
    var countDirection = "Down"
    var maxCounter = 5
    var counterTimer: Timer? = nil
    
    var wordChosen: String = "coiffeur"
    
    var arrayOfWord: [String] = []
    var arrayOfSoluce: [String] = []
    var nbTry: Int = 10
    var counter: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(countDirection == "Down"){
            counterSeconds = maxCounter;
        }
        else{
            counterSeconds = 0;
        }
        counterLbl.text = String(counterSeconds);
        
        for char in wordChosen{
            arrayOfWord.append(String(char))
            arrayOfSoluce.append("_")
        }
        print(arrayOfWord)
        print(arrayOfSoluce)
        updateLabelSoluce()
    }
    
    @IBAction func onClickBtn(_ sender: UIButton) {
        var btnTitle = sender.titleLabel?.text ?? ""
        btnTitle = btnTitle.lowercased()
        var status = false;
        
        if(counterTimer == nil){
            startTimer();
        }
        
        for (index, element) in arrayOfWord.enumerated(){
            if (element == btnTitle){
                arrayOfSoluce[index] = btnTitle.uppercased()
                updateLabelSoluce()
                sender.removeFromSuperview()
                status = true;
            }
        }

        if (!status){
            counter += 1;
            sender.removeFromSuperview()

            if (counter >= nbTry){
                changeImg(nbr:counter);
                textAction.text = "PERDU !";
            } else {
                changeImg(nbr:counter);
            }
        }
        
        checkIfWin()
    }
    
    func checkIfWin(){
        var tab: [String] = []
        for element in arrayOfSoluce{
            if (element == "_"){
                tab.append(element)
            }
        }
        if (tab.isEmpty){
            let text = "gagné !"
            textAction.textColor = UIColor.systemGreen
            textAction.text = text.uppercased()
        }
    }
    
    func updateLabelSoluce(){
        word.text! = ""
        for letter in arrayOfSoluce{
            word.text! += letter
        }
    }
    
    
    func changeImg(nbr:Int){
        if(nbr <= 9){
            penduImg.image = UIImage(named: String(nbr+1)+"coup")
        }
        else{
            penduImg.image = UIImage(named: "pendu")
        }
    }
    
    func startTimer(){
        counterTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSecondsLblCounter), userInfo: nil, repeats: true)
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

}
