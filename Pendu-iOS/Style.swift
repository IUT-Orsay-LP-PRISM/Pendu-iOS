//
//  Style.swift
//  Pendu-iOS
//
//  Created by Louis Lubineau on 30/05/2023.
//

import UIKit

class CustomButton: UIButton {

    var myValue: Int

    required init(value: Int = 0) {
        // set myValue before super.init is called
        self.myValue = value

        super.init(frame: .zero)

        // set other operations after super.init, if required
        backgroundColor = .red
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
