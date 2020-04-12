//
//  ViewController.swift
//  calculatorProject
//
//  Created by Kary Martinez on 4/8/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {
    
  enum Operations {
        case add
        case subtract
        case multiply
        case divide
    }
    var firstNumber = 0
    var resultNumber = 0

    var currentOperation: Operations?
    
    
    @IBOutlet var BackgroundView: UIView!
    

    
    //interface
    private func setUpPad() {
        let buttonsConstraints: CGFloat = view.frame.size.width / 4
        
        let operations = ["=","+","-","x","/"]
        for x in 0..<5 {
            let Sidebuttons = UIButton(frame: CGRect(x: buttonsConstraints * 3, y: BackgroundView.frame.size.height-(buttonsConstraints * CGFloat(x+1)),
           width:  buttonsConstraints, height: buttonsConstraints))
            Sidebuttons.setTitle(operations[x], for: .normal)
            Sidebuttons.tag = x+1
            BackgroundView.addSubview(Sidebuttons)
            
        }
        
        for x in 0..<3 {
            let buttons1through3 = UIButton(frame: CGRect(x: buttonsConstraints * CGFloat(x),y: BackgroundView.frame.size.height-(buttonsConstraints*2), width: buttonsConstraints, height: buttonsConstraints))
            buttons1through3.setTitle("\(x+1)", for: .normal)
            buttons1through3.tag = x+2
            BackgroundView.addSubview(buttons1through3)
        }
        
        for x in 0..<3 {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
//        addSubview()
//       // setUpPad()
//        setViewConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        setUpPad()
      
       
     }

     

}

 
