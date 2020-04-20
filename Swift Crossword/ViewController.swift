//
//  ViewController.swift
//  Swift Crossword
//
//  Created by Jeffrey  on 4/12/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import UIKit

struct Word {
    let text: String;
    let arrayOfLabels: [UILabel];
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var word0: [UILabel]!
    
    @IBOutlet var word1: [UILabel]!
    
    @IBOutlet var word2: [UILabel]!
    
    @IBOutlet var word3: [UILabel]!
    
    @IBOutlet var word4: [UILabel]!
    
    @IBOutlet var word5: [UILabel]!
    
    
    @IBOutlet weak var wordNumber: UILabel!
    
    @IBOutlet weak var answerField: UITextField!
    
    @IBOutlet weak var answerMessage: UILabel!
    
    var words: [Word] = []
    var n: Int = 0
    var cancelled: Bool = false
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
         words = [
                   Word(text: "and",     arrayOfLabels: word0),
                   Word(text: "not",     arrayOfLabels: word1),
                   Word(text: "ternary", arrayOfLabels: word2),
                   Word(text: "let",     arrayOfLabels: word3),
                   Word(text: "print",   arrayOfLabels: word4),
                   Word(text: "var",     arrayOfLabels: word5)
               ]
        newNumber(n)
    }
    
    
     @IBAction func valueChanged(_ sender: UIStepper) {
           newNumber(Int(sender.value))       //sender.value in range 0 to 5 inclusive
       }
    
    //Called at start of program, and when user touches the stepper.

       func newNumber(_ i: Int) {
           //Clear out the background color of the previous word.
           for label: UILabel in words[n].arrayOfLabels {
               label.backgroundColor = .clear;
           }

           n = i;
           wordNumber.text = "\(n + 1)"; //Humans like to count starting at 1.
           answerMessage.text = "";
           answerField.text = "";
           answerField.resignFirstResponder();   //Dismiss the keyboard.

           //Give the current word a yellow background.
           for label: UILabel in words[n].arrayOfLabels {
               label.backgroundColor = .yellow;
           }
       }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        cancelled = true;
        answerField.resignFirstResponder();   //Dismiss the keyboard.
    }
    
    
        //Called when return key on UITextField's keyboard is pressed.

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let s: String = textField.text!;
        if s.count < 3 {
            answerMessage.text = "Need at least 3 letters.";
        } else if s.lowercased().first(where: {!"abcdefghijklmnopqrstuvwxyz".contains($0)}) != nil {
            answerMessage.text = "Only letters!";
        }

        textField.resignFirstResponder();   //Dismiss the keyboard.
        return true;
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if cancelled {
            cancelled = false;
        } else if answerField.text! == "" {
            answerMessage.text = "Please enter an answer."
        } else if answerField.text!.lowercased() != words[n].text {
            answerMessage.text = "Wrong Answer. Try Again."
        } else {
            answerMessage.text = "Correct";
            var i: Int = 0;
            for char: Character in words[n].text.uppercased() {
                print("char")
                words[n].arrayOfLabels[i].text = String(char);
                i += 1;
            }
        }
    }
    
    
    
    
}

