//
//  SubjectObject.swift
//  iQuiz
//
//  Created by Chris Li on 5/15/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit

class SubjectObject: NSObject {
    var title: String
    var desc: String
    var questions: [QuestionObject]
    
    init(title: String, desc: String) {
        self.title = title
        self.desc = desc
        self.questions = []
    }
}
