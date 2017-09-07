//
//  ViewController.swift
//  greatNumber
//
//  Created by Liseth Cardozo Sejas on 9/6/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userInput: UITextField!
    
    var randomNumber = ViewController.generateRandomValue()
    
    @IBAction func guessInputButton(_ sender: UIButton) {
       
        if let input = userInput.text {
           
            print(randomNumber)
            if Int(input)! < randomNumber {
                createAlert(title: "Incorrect", message: " \(input) is too low", buttonTitle: "Try again")
            }
            else if Int(input)! > randomNumber {
                 createAlert(title: "Incorrect", message: " \(input) is too high", buttonTitle: "Try again" )
            }
            else {
                createAlert(title: "Correct", message: "You guess the great number", buttonTitle: "Play again")
                randomNumber = ViewController.generateRandomValue()
            }
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func generateRandomValue()-> Int {
        let randomNumber = Int(arc4random_uniform(101) + 1)
        return randomNumber
    }

    func createAlert(title:String, message:String, buttonTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
           
        }))
        self.present(alert, animated: true, completion: nil)
    }


}

