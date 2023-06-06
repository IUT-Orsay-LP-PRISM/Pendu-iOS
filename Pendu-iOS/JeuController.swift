//
//  JeuController.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 16/05/2023.
//

import UIKit
import CoreData

class JeuController: UIViewController {
    @IBOutlet weak var penduImg: UIImageView!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var textAction: UILabel!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var textEnd: UILabel!
    @IBOutlet weak var textWordEnd: UILabel!
    @IBOutlet weak var btnRetry: UIButton!
    
    var counterMinutes = 0;
    var counterSeconds = 0;
    var totalSeconds = 0;
    //var counterMiliseconds = 0;
    var countDirection = "Up"
    var maxCounterSeconds = 10
    var counterTimer: Timer? = nil
    var buttons = [UIButton]()
    var customSettings = [String:String]()
    
    var wordChosen = ""
    
    var arrayOfWord: [String] = []
    var arrayOfSoluce: [String] = []
    var nbTry: Int = 10
    var counter: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wordChosen = JsonRead.readJSONFile()
        print(customSettings)
        
        for subview in view.subviews {
            if let button = subview as? UIButton{
                buttons.append(button)
            }
        }
        
        if(countDirection == "Down"){
            counterMinutes = maxCounterSeconds / 60;
            counterSeconds = maxCounterSeconds % 60;
        }
        else{
            counterSeconds = 0;
        }
        counterLbl.text = "Timer : "+String(counterMinutes)+"m"+String(counterSeconds)+"s";
        textEnd.text = ""
        textWordEnd.text = "";
        textAction.text = ""
        
        for char in wordChosen{
            arrayOfWord.append(String(char))
            arrayOfSoluce.append("_")
        }
        print(arrayOfWord)
        print(arrayOfSoluce)
        updateLabelSoluce()
    }
    
    @IBAction func startGame(){
        /* if(btnRetry. == "DÉMARRER"){
            
        }
        else if(btnRetry.text == "REDÉMARRER"){
            
        }*/
                
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
                gameOver();
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
            gameWon();
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
        gameOver();
    }
    
    func gameWon(){
        counterTimer?.invalidate();
        let text = "Vous avez GAGNÉ !"
        textAction.text = text
        textEnd.text = "Nombre d'erreurs :"
        textWordEnd.text = String(counter)
        btnRetry.layer.opacity = 1
        textAction.textColor = UIColor.systemGreen
        for button in buttons{
            button.removeFromSuperview()
        }
    }
    
    func gameOver(){
        counterTimer?.invalidate();
        changeImg(nbr:nbTry);
        textAction.text = "Vous avez PERDU !";
        textEnd.text = "Le mot était : ";
        textWordEnd.text = wordChosen.uppercased();
        removeAllButtons();
    }
    
    @objc func updateSecondsLblCounter() {
            if(countDirection == "Up"){
                if(counterSeconds < 60){
                    counterSeconds += 1;
                }
                else{
                    counterSeconds = 0;
                    counterMinutes += 1;
                }
                counterLbl.text = "Timer  : "+String(counterMinutes)+"m"+String(counterSeconds)+"s";
            }
            else if(countDirection == "Down"){
                totalSeconds = (counterMinutes * 60) + counterSeconds;
                if(totalSeconds != 0){
                    if(counterSeconds > 0){
                        counterSeconds -= 1;
                            totalSeconds = (counterMinutes * 60) + counterSeconds;
                        if(totalSeconds == 0){
                            timeIsOut();
                        }
                    }
                    else{
                        counterSeconds = 60;
                        counterMinutes -= 1;
                    }
                    counterLbl.text = "Timer : "+String(counterMinutes)+"m"+String(counterSeconds)+"s ";
                }
                else{
                    timeIsOut();
                }
            }
            else{
                print("Bad value for var countDirection");
            }
        }
        func removeAllButtons(){
            for button in buttons{
                button.isHidden = true;
            }
        }
    
    func showAllButtons(){
        for button in buttons{
            button.isHidden = false;
        }
    }

    func addStyleToBtn(btn: UIButton, revert: Bool){
        btn.layer.shadowColor = UIColor.systemYellow.cgColor
        if (revert){
            btn.layer.shadowColor = UIColor.lightIndigo.cgColor
        }
        btn.layer.shadowOffset = CGSize(width: 4.0, height: 6.0)
        btn.layer.shadowRadius = 0
        btn.layer.shadowOpacity = 1
        btn.layer.cornerRadius = 0.0
        btn.layer.masksToBounds = false
    }
    
    func restart(){
        wordChosen = JsonRead.readJSONFile()
        
        for subview in view.subviews {
            if let button = subview as? UIButton{
                buttons.append(button)
            }
        }
        
        if(countDirection == "Down"){
            counterMinutes = maxCounterSeconds / 60;
            counterSeconds = maxCounterSeconds % 60;
        }
        else{
            counterSeconds = 0;
        }
        counterLbl.text = "Timer : "+String(counterMinutes)+"m"+String(counterSeconds)+"s";
        textEnd.text = ""
        textWordEnd.text = "";
        textAction.text = ""
        
        for char in wordChosen{
            arrayOfWord.append(String(char))
            arrayOfSoluce.append("_")
        }
        print(arrayOfWord)
        print(arrayOfSoluce)
        updateLabelSoluce()
    }
    
}
