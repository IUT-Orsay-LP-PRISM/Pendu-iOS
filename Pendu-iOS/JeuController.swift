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
    @IBOutlet weak var textLost: UILabel!
    
    var wordChosen: String = "coiffeur"
    
    var arrayOfWord: [String] = []
    var arrayOfSoluce: [String] = []
    var nbTry: Int = 10
    var counter: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        var ended = false;

        
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
                textLost.text = "PERDU !";
            } else {
                changeImg(nbr:counter);
            }
        }
        
        checkIfWin()
    }
    
    func checkIfWin(){
        for element in arrayOfSoluce{
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

}
