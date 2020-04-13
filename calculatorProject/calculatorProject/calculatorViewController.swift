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
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    @IBOutlet var BackgroundView: UIView!
    
    
    //interface
    private func setUpPad() {
        let buttonsConstraints: CGFloat = view.frame.size.width / 4
        
        
        
        let acButton = UIButton(frame: CGRect(x: 0, y: BackgroundView.frame.size.height-(buttonsConstraints*5), width: view.frame.size.width - buttonsConstraints, height: buttonsConstraints))
        acButton.setTitle("AC", for: .normal)
         Utilities.NumberButtonsDesign(button: acButton, symbol: String.init()  )
        BackgroundView.addSubview(acButton)
        
        let operations = ["=","+","-","x","/"]
        for x in 0..<5 {
            let Sidebuttons = UIButton(frame: CGRect(x: buttonsConstraints * 3, y: BackgroundView.frame.size.height-(buttonsConstraints * CGFloat(x+1)),
           width:  buttonsConstraints, height: buttonsConstraints))
            Utilities.sideButtonsDesign(button: Sidebuttons, symbol: String.init()  )
            Sidebuttons.setTitle(operations[x], for: .normal)
            Sidebuttons.tag = x+1
            BackgroundView.addSubview(Sidebuttons)
              Sidebuttons.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        }
        
        for x in 0..<3 {
            let buttons1through3 = UIButton(frame: CGRect(x: buttonsConstraints * CGFloat(x),y: BackgroundView.frame.size.height-(buttonsConstraints*2), width: buttonsConstraints, height: buttonsConstraints))
            Utilities.NumberButtonsDesign(button: buttons1through3, symbol: String.init()  )
            buttons1through3.setTitle("\(x+1)", for: .normal)
            buttons1through3.tag = x+2
            BackgroundView.addSubview(buttons1through3)
               buttons1through3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        
        for x in 0..<3 {
            let buttons4through6 = UIButton(frame: CGRect(x: buttonsConstraints * CGFloat(x),y: BackgroundView.frame.size.height-(buttonsConstraints*3), width: buttonsConstraints, height: buttonsConstraints))
             Utilities.NumberButtonsDesign(button: buttons4through6, symbol: String.init()  )
            buttons4through6.setTitle("\(x+4)", for: .normal)
            buttons4through6.tag = x+5
            BackgroundView.addSubview(buttons4through6)
               buttons4through6.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        for x in 0..<3 {
            let buttons7through9 = UIButton(frame:CGRect(x: buttonsConstraints * CGFloat(x),y:
                BackgroundView.frame.size.height-(buttonsConstraints*4), width: buttonsConstraints, height: buttonsConstraints))
             Utilities.NumberButtonsDesign(button: buttons7through9, symbol: String.init()  )
            buttons7through9.setTitle("\(x+7)", for: .normal)
            buttons7through9.tag = x+8
            BackgroundView.addSubview(buttons7through9)
            buttons7through9.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)

        }
        
        let buttonZero = UIButton(frame: CGRect(x: 0, y: BackgroundView.frame.size.height-buttonsConstraints, width: buttonsConstraints*3, height: buttonsConstraints))
            buttonZero.setTitle("0", for: .normal)
         Utilities.NumberButtonsDesign(button: buttonZero, symbol: String.init()  )
        buttonZero.tag = 1
        BackgroundView.addSubview(buttonZero)
          buttonZero.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        
    }
    
    
    @objc func clearResult() {
       // resultsLabel.text = "0"
        currentOperation = nil
        firstNumber = 0
    }

    @objc func numberPressed(_ sender: UIButton) {
          let tag = sender.tag - 1

          if resultsLabel.text == "0" {
              resultsLabel.text = "\(tag)"
          }
          else if let text = resultsLabel.text {
              resultsLabel.text = "\(text)\(tag)"
          }
      }
 
    func calculator(num1: Double, op: String, num2: Double) -> Double {
        switch op {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            return num1 / num2
        default: return Double()
        }
    }
        
        @objc func operationPressed(_ sender: UIButton) {
            let tag = sender.tag
         
           if let text = resultsLabel.text, let value = Int(text), firstNumber == 0 {
                firstNumber = value
                resultsLabel.text = "0"
            
            }

            if tag == 1 {
                if let operation = currentOperation {
                    var secondNumber = 0
                    if let text = resultsLabel.text, let value = Int(text) {
                        secondNumber = value
                    }
         
                    switch operation {
                    case .add:

                        let result = firstNumber + secondNumber
                        resultsLabel.text = "\(result)"
                        break

                    case .subtract:
                        let result = firstNumber - secondNumber
                        resultsLabel.text = "\(result)"

                        break

                    case .multiply:
                        let result = firstNumber * secondNumber
                        resultsLabel.text = "\(result)"

                        break

                    case .divide:
                        let result = firstNumber / secondNumber
                        resultsLabel.text = "\(result)"
                        break
                    }
                }
            }
            else if tag == 2 {
                currentOperation = .add
            }
            else if tag == 3 {
                currentOperation = .subtract
            }
            else if tag == 4 {
                currentOperation = .multiply
            }
            else if tag == 5 {
                currentOperation = .divide
            }

     }
    

    func myMap(inputArray: [Int], operation: String, transformation: (Int))  -> [Int] {
        var answerArray = [Int]()
        for numbers in inputArray {
            switch operation {
            case "*":
                answerArray.append(numbers * transformation)
            case "/":
                answerArray.append(numbers / transformation)
            default: print(" map operator ")
            print("")
            }
        }
        return(answerArray)
    }
    func myReduce(inputArray: [Int], operation: String, startingValue: (Int))  -> Int {
        var answer = startingValue
        for numbers in inputArray {
            switch operation {
            case "+":
                answer += numbers
            case "*":
                answer *= numbers
            default: print("reduce")
            print("")
            }
        }
        return answer
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        setUpPad()
      
       
     }

     

}

 
