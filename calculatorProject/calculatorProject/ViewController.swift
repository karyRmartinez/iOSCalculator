//
//  ViewController.swift
//  calculatorProject
//
//  Created by Kary Martinez on 4/8/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  enum Operations {
        case add
        case subtract
        case multiply
        case divide
    }
    
    lazy var BackgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

 
