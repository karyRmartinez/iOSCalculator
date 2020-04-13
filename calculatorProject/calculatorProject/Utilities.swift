//
//  Utilities.swift
//  calculatorProject
//
//  Created by Kary Martinez on 4/12/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import Foundation
import UIKit

struct Utilities {
static func sideButtonsDesign(button: UIButton, symbol: String) {
    button.backgroundColor = .systemOrange
    button.setTitleColor(.white, for: .normal)
}
    static func NumberButtonsDesign(button: UIButton, symbol: String) {
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
    }
       
}
