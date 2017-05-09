//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Chris Li on 5/8/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    let transitionManager = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSwipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizerDirection.right {
            // OLD CODE FOR SEGUE
            // identifier has to match storyboard id
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "questionVCid") as! QuestionViewController
//            vc.transitioningDelegate = self.transitionManager
//            self.present(vc, animated: true, completion: nil)
            performSegue(withIdentifier: "aToQ", sender: nil)
            print("swipe right")
            
        } else if sender.direction == UISwipeGestureRecognizerDirection.left {
            performSegue(withIdentifier: "toResults", sender: nil)
            print("swipe left")
        } else {
            print("not recognized")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
