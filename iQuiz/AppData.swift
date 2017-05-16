//
//  AppData.swift
//  iQuiz
//
//  Created by Chris Li on 5/16/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit

class AppData: NSObject {
    
    static let shared = AppData()
    
    var topicList: [SubjectObject] = []
    var selectedTopic: SubjectObject?
    
    override init(){
        super.init()
    }

}
