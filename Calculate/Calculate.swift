//
//  ViewController.swift
//  Calculate
//
//  Created by Антон Красиков on 03.11.2022.
//

import UIKit

class Calculate: UIViewController {
   

    
//    @IBOutlet weak var digitalButton: UIButton!
    
    @IBOutlet weak var outlineLabel: UILabel!
    
    var firstNumber:String = ""
    
    var secondNumber:String = ""
    
    var operand:String = ""
    
    
    
    @IBAction func digitalTapped(_ sender: UIButton){
        addNumber(number: (sender.titleLabel?.text)!)
    }
    func addNumber(number: String){
        if operand.isEmpty {
            firstNumber += number
            outlineLabel?.text = firstNumber
        } else {
            secondNumber += number
            outlineLabel?.text = secondNumber
        }
    }
    
    @IBAction func operandAction(_ sender: UIButton){
        guard !firstNumber.isEmpty else{ return }
        operand = sender.currentTitle!
    }
    
    @IBAction func clearCalculateAction(_ sender: UIButton){
        firstNumber = ""
        secondNumber = ""
        operand = ""
        outlineLabel.text = "0"
    }
    
    @IBAction func resultAction(_ sender: UIButton){
        var result: Double = 0.0
        
        
        switch operand {
        case "/":
            guard !isZero(number: secondNumber) else{return AlertController(content: "Division 0")}
            result = division(a: firstNumber, b: secondNumber)
        case "-":
            result = substraction(a: firstNumber, b: secondNumber)
        case "+":
            result = addition(a: firstNumber, b: secondNumber)
        case "*":
            result = multiplication(a: firstNumber, b: secondNumber)
        default:
            break
        }
        
        outlineLabel.text = showResult(number: result)
        firstNumber = String(Int(result))
        secondNumber = ""
        operand = ""
    }
    
    func addition(a:String,b:String)-> Double{
        return Double(a)! + Double(b)!
    }
    func substraction(a:String,b:String)-> Double{
        return Double(a)! - Double(b)!
    }
    func multiplication(a:String,b:String)-> Double{
        return Double(a)! * Double(b)!
    }
    func division(a:String,b:String)-> Double{
        return Double(a)! / Double(b)!
    }
    
    func showResult(number: Double) -> String {
        if number.truncatingRemainder(dividingBy: 1.0) == 0.0{
            return String(Int(number))
        }else{
            return String(number)
        }
    }
    func isZero(number:String)-> Bool{
        guard number == "0" else { return false }
        return true
    }

    func AlertController(content : String){
        let alertController = UIAlertController(title: "Error", message: content, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default){ action in
            print("1")
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

