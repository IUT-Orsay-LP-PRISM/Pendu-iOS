//
//  ViewController.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 09/05/2023.
//

import UIKit

extension UIColor{
    static let lightIndigo = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
}

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var rulesBtn: UIButton!
    @IBOutlet weak var customBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addStyleToBtn(btn: playBtn, revert: false)
        addStyleToBtn(btn: customBtn, revert: false)
        addStyleToBtn(btn: rulesBtn, revert: true)
        
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

    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "DeMenuVersJeu" {
            // Definition du controler de destinatation
            let destinationVC = segue.destination as! MenuController
         }
    }

}

