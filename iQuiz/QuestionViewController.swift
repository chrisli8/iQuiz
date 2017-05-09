//
//  ViewController.swift
//  iQuiz
//
//  Created by Chris Li on 5/1/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    var selectedAnswer: UIButton!
    
    let transitionManager = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAnswerButtonPressed(_ sender: UIButton) {
        Answer1.isSelected = false
        Answer2.isSelected = false
        Answer3.isSelected = false
        Answer4.isSelected = false
        sender.isSelected = !sender.isSelected
        self.selectedAnswer = sender
    }
    
    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizerDirection.right {
            performSegue(withIdentifier: "abandonQuizQuestion", sender: nil)
            print("swipe right")
            
        } else if sender.direction == UISwipeGestureRecognizerDirection.left {
            performSegue(withIdentifier: "toAnswer", sender: nil)
            print("swipe left")
        }
    }

}

