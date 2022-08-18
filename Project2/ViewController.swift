//
//  ViewController.swift
//  Project2
//
//  Created by Tetiana Borysova on 18.08.22.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet var totalScore: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france", "germany",
                      "ireland", "italy", "monaco", "nigeria",
                      "poland", "spain", "switzerland", "uk", "ukraine", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        totalScore.text = "Total score: \(score)"
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            totalScore.text = "Total score: \(score)"
        } else {
            title = "Wrong"
            score -= 1
            totalScore.text = "Total score: \(score)"
            let ac = UIAlertController(title: title, message:
                                        "Wrong! That’s the flag of \(countries[sender.tag].uppercased())", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: .none))
            
            present(ac, animated: true)
            
        }
        
        numberOfQuestion += 1
        
        let ac = UIAlertController(title: title, message:
                                    "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
}

