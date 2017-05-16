//
//  QuestionObject.swift
//  iQuiz
//
//  Created by Chris Li on 5/15/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit

class QuestionObject: NSObject {
    var question: String
    var answers: [String]
    var answerIndex = 0
    
    init(question: String, answers: [String], answerIndex: Int) {
        self.question = question
        // Incapsulation concern?
        self.answers = answers
        self.answerIndex = answerIndex
    }
    

}
