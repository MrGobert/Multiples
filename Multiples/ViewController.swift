//
//  ViewController.swift
//  Multiples
//
//  Created by James Gobert on 10/31/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Used UITextFieldDelegate class and functions below to fix keyboard tap issue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textBox.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


//Properties
var multiplyBy = 0
var multiplierNumber = 0
var maxTotal = 1000
    
//IB Outlets for initial start

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
//IB Outlets for second/third screen states

    @IBOutlet weak var pressAddButtonText: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textResults: UITextView!
    @IBOutlet weak var resetGame: UIButton!
    
    
  //Settings when START button is tapped
    
    @IBAction func pressStartButton(sender: UIButton!) {
        
        if textBox.text != nil && textBox.text != "" {
            
        
        logo.hidden = true
        textBox.hidden = true
        startButton.hidden = true
        textResults.hidden = true
        resetGame.hidden = false
        
        pressAddButtonText.hidden = false
        addButton.hidden = false
            
        multiplyBy = Int(textBox.text!)!
            
        }
        
    }
    
//When ADD button is tapped
    
    @IBAction func pressAddButton(sender: UIButton!) {
        
        pressAddButtonText.hidden = true
        textResults.hidden = false
        
    
        if multiplierNumber + multiplyBy < maxTotal {
            multiplierNumber += multiplyBy
            
        UpdateTotal()
        
        
        }else {
            gameReset()
        }
        
    }
    
    //Multiplier Output
    
    func UpdateTotal() {
        textResults.text = "\(multiplierNumber) + \(multiplyBy) = \(multiplierNumber + multiplyBy)"
    }
    
    @IBAction func resetGameButton(sender: UIButton!) {
        
        gameReset()
    }
    
    //Reset Game button
    
    func gameReset() {
        
        logo.hidden = false
        textBox.hidden = false
        startButton.hidden = false
        textResults.hidden = true
        resetGame.hidden = true
        
        pressAddButtonText.hidden = true
        addButton.hidden = true
        
        multiplyBy = 0
        textBox.text = nil
    }
    
}

