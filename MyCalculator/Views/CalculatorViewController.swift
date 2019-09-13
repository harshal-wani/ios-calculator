//
//  ViewController.swift
//  MyCalculator
//
//  Created by Harshal Wani on 18/07/19.
//  Copyright © 2019 Harshal Wani. All rights reserved.
//

import UIKit

import SwiftTheme

class CalculatorViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var finalResultLabel: UILabel!
    
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet var menuButton: UIButton!
    
    //MARK:- Local variables
    
    var selectedOpButton: UIButton?
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var isFinalViewAnimated = false
    var hasOp = false
    
    //MARK:- Life Cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.theme_backgroundColor = GlobalPicker.backgroundColor
        resultLabel.text = ""
        finalResultLabel.text = ""
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if MyThemes.isNight() == true {
            return .lightContent
        }
        return .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultLabel.theme_textColor = GlobalPicker.barTextColor
        finalResultLabel.theme_textColor = GlobalPicker.barTextColor
    }
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        // Use data from the view controller which initiated the unwind segue
    }
    
    //MARK:- Action events method
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showMenu", sender: self)
    }
    @IBAction func numberKeysPress(_ sender: UIButton) {
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            
            if isFirstNumber {
                firstNumberText = "\(firstNumberText)\(text)"
            } else {
                secondNumberText = "\(secondNumberText)\(text)"
            }
            resultLabel.text = "\(currentText)\(text)"
        }
    }
    @IBAction func handleButtonPress(sender: UIButton) {
        
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
                
            case "+", "x", "÷", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultLabel.text = "\(currentText)\(op)"
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                animateFinalResultView(currentText: currentText)
                break
            case "C":
                firstNumberText = ""
                secondNumberText = ""
                resultLabel.text = ""
                finalResultLabel.text = ""
//                isFinalViewAnimated = false
                break
            case "←":
                break
            case "+/-", "%":
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break;
            }
        }
    }
    
    //MARK: - Private methods
    
    /// Make arithmatic operation
    ///
    /// - Returns: number output
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText)!
        let secondNumber = Double(secondNumberText)!
        //        firstNumberText = ""
        secondNumberText = ""
        
        var result: Double = 0
        
        switch op {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "x":
            result = firstNumber * secondNumber
        case "÷":
            result = firstNumber / secondNumber
        default:
            result = 0
        }
        return result
    }
    
    /// Animate and position result
    ///
    /// - Parameter currentText: current result string
    private func animateFinalResultView(currentText: String) {
        
        self.resultLabel.text = ""
        self.finalResultLabel.text =  "\(currentText)"
        if isFinalViewAnimated != true {
            isFinalViewAnimated = true
            let originalTransform = self.finalResultLabel.transform
            let scaledTransform = originalTransform.scaledBy(x: 0.5, y: 0.5)
            let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: self.finalResultLabel.frame.width/2, y: -(self.resultLabel.frame.height+(self.finalResultLabel.frame.height/2)))
            UIView.animate(withDuration: 0.5, animations: {
                self.finalResultLabel.transform = scaledAndTranslatedTransform
                
            },completion: { finish in
                self.resultLabel.text = "\(self.calculate())"
                if let text = self.resultLabel.text {
                    self.firstNumberText = "\(text)"
                }
            })
        } else {
            self.resultLabel.text = "\(self.calculate())"
        }
    }
}

