//
//  JeuController.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 16/05/2023.
//

import UIKit

class JeuController: UIViewController {
    @IBOutlet weak var word: UILabel!
    var wordChosen: String = "coiffeur"
    var tableOfWord: [String] = []
    var counter: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        let wordCount: Int = wordChosen.count
        word.text = ""
        
        for _ in 1...wordCount{
            word.text! += "_"
        }
        for char in wordChosen{
            tableOfWord.append(String(char))
        }
    }
    
    @IBAction func onClickBtn(_ sender: UIButton) {
        let btnTitle = sender.titleLabel?.text ?? ""
        
        if (tableOfWord[counter] == btnTitle){
            word.text = tableOfWord[counter] + "_______"
        }
        counter += 1
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
