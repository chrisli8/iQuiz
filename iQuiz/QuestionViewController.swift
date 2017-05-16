//
//  ViewController.swift
//  iQuiz
//
//  Created by Chris Li on 5/1/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var topicTitle: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    var selectedAnswer: UIButton!
    
    let transitionManager = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        topicTitle.text = AppData.shared.selectedTopic?.title
        questionText.text = AppData.shared.selectedTopic?.questions[0].question
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAnswerButtonPressed(_ sender: UIButton) {
        answer1.isSelected = false
        answer2.isSelected = false
        answer3.isSelected = false
        answer4.isSelected = false
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

