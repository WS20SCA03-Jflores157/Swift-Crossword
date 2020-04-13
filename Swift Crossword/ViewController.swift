//
//  ViewController.swift
//  Swift Crossword
//
//  Created by Jeffrey  on 4/12/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var word1: [UILabel]!
    
    @IBOutlet var word2: [UILabel]!
    
    @IBOutlet var word3: [UILabel]!
    
    @IBOutlet var word4: [UILabel]!
    
    @IBOutlet var word5: [UILabel]!
    
    @IBOutlet var word6: [UILabel]!
    
    
    @IBOutlet weak var wordNumber: UILabel!
    
    @IBOutlet weak var answerField: UITextField!
    
    @IBOutlet weak var answerMessage: UILabel!
    
    
    let answers: [String] = ["and","not","ternary","let","print","var"]
    
    var labelIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func valueChanged(_ sender: UIStepper) {
        
        let currentWord: Int = Int(sender.value)
        wordNumber.text = "\(currentWord)"
        
        if answerField.text != "" && answerMessage.text != "" {
            answerField.text = ""
            answerMessage.text = ""
        }
        
    }
    
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        let currentAnswer: String = answers[Int(wordNumber.text!)! - 1]
        
        let answerLabels: [[UILabel]] = [word1,word2,word3,word4,word5,word6]
        
        if answerField.text! == ""{
            answerMessage.text = "Please enter an answer."
        }
            
        else{
            
            if answerField.text!.lowercased() == currentAnswer  {
                answerMessage.text = "Correct"
                
                
                
                for char in answerField.text!{
                    
                    
                    let currentWord: [UILabel] = answerLabels[Int(wordNumber.text!)! - 1]
                    let letter: String = char.uppercased()
                    
                    currentWord[labelIndex].text = letter
                    
                    labelIndex += 1
                    
                }
                
                
                labelIndex = 0
                
                
                
                
                
            }
            else{
                answerMessage.text = "Wrong Answer. Try Again."
            }
            
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        let decimalCharacters: CharacterSet = CharacterSet.decimalDigits
        
        let decimalRange: Range<String.Index>? = textField.text!.rangeOfCharacter(from: decimalCharacters)
        
        if textField.text!.count < 3 || decimalRange != nil  {
            answerMessage.text = "Please enter a valid word."
        }
        else{
            answerMessage.text = ""
            textField.resignFirstResponder()
        }
        
        
        return true
    }
    
    
    
    
}

