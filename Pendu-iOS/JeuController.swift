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
        // On compte le nbre de lettre du mot donné "coiffeur" : 8
        let wordCount: Int = wordChosen.count
        // on set le text de word iboutlet text du pendu à rien
        word.text = ""
        
        // On parcours le nbre de lettre donc 8 pour afficher 8 _
        // On divise chaque lettre dans un tableau ["c", "o", "i"]...
        for char in wordChosen{
            arrayOfWord.append(String(char))
            arrayOfSoluce.append("_")
        }
        
        for letter in arrayOfSoluce{
            word.text! += letter
        }
        
        print("Tableau mot solution :")
        print(arrayOfWord)
        print("Tableau lettre tapée : ")
        print(arrayOfSoluce)
    }
    
    @IBAction func onClickBtn(_ sender: UIButton) {
        // On récupère la valeur du bouton et on la lowercase
        var btnTitle = sender.titleLabel?.text ?? ""
        btnTitle = btnTitle.lowercased()
        var counterArray: Int = 0
        
        // ici que va se jouer la logique :
        // onClick, on récupère le btnTitle
        // si le btnTitle est égale à n'importe qu'elle être du mot
        // ça veut dire que c'est bon du coup le compteur ne bouge pas
        
        for (index, element) in arrayOfWord.enumerated(){
            // On parcours chaque lettre
            print(String(index) + " - " + element)
            
        }

        /*
         if (letter == btnTitle){
             print(arrayOfWord[counterArray])
             counterArray += 1
         } else {
             counter += 1;
             sender.isEnabled = false;
                 
             if (counter >= nbTry){
                 changeImg(nbr:counter);
                 textLost.text = "PERDU !";
             } else {
                 changeImg(nbr:counter);
             }
             break;
         }
         
         */
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
