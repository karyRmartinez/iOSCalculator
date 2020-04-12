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
            let buttons4through6 = UIButton(frame: CGRect(x: buttonsConstraints * CGFloat(x),y: BackgroundView.frame.size.height-(buttonsConstraints*3), width: buttonsConstraints, height: buttonsConstraints))
            buttons4through6.setTitle("\(x+4)", for: .normal)
            buttons4through6.tag = x+5
            BackgroundView.addSubview(buttons4through6)
        }
        for x in 0..<3 {
            let buttons7through9 = UIButton(frame:CGRect(x: buttonsConstraints * CGFloat(x),y:
                BackgroundView.frame.size.height-(buttonsConstraints*4), width: buttonsConstraints, height: buttonsConstraints))
            buttons7through9.setTitle("\(x+7)", for: .normal)
            buttons7through9.tag = x+8
            BackgroundView.addSubview(buttons7through9)
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

 
