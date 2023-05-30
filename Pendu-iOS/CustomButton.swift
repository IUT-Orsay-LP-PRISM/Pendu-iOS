//
//  CustomButton.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 30/05/2023.
//

import UIKit

class CustomButton: UIButton {

    required init(revert: Bool = false) {
        super.init(frame: .zero)
    
        super.layer.shadowColor = UIColor.systemYellow.cgColor
        if (revert){
            super.layer.shadowColor = UIColor.lightIndigo.cgColor
        }
        super.layer.shadowOffset = CGSize(width: 4.0, height: 6.0)
        super.layer.shadowRadius = 0
        super.layer.shadowOpacity = 1
        super.layer.cornerRadius = 0.0
        super.layer.masksToBounds = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
