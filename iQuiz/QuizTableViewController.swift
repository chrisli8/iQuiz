//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by Chris Li on 5/1/17.
//  Copyright © 2017 Chris Li. All rights reserved.
//

import UIKit
import Alamofire

class QuizTableViewController: UITableViewController {
    // Mathematics, Marvel Super Heroes, and Science
    var topics = ["Mathematics", "Marvel Super Heroes", "Science"]
    var descriptions = ["A topic about Math","A topic about heroes","A topic about Science"]
    var images = ["40-TableCellMathematics", "40-TableCellHeros", "40-TableCellScience"]
    
    var topicList: [SubjectObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")
        
        // Builds up model. Should be put in Model side of program
        Alamofire.request(url!).responseJSON{ response in
            debugPrint(response)
            
            if let json = response.result.value as? [[String:Any]]{
                for index in 0...json.count - 1{
                    let topic = json[index]["title"] as! String
                    let desc = json[index]["desc"] as! String
                    let subject = SubjectObject(title: topic, desc: desc)
                    
                    let questionJson = json[index]["questions"] as! [[String:Any]]
                    for number in 0...questionJson.count - 1 {
                        let text = questionJson[number]["text"] as! String
                        let answers = questionJson[number]["answers"] as! [String]
                        let answer = Int(questionJson[number]["answer"] as! String)
                        subject.questions.append(QuestionObject(question: text, answers: answers, answerIndex: answer!))
                    }
                    self.topicList.append(subject)
                }
            }
            AppData.shared.topicList = self.topicList
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.topicList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! QuizTableViewCell

        // Configure the cell...
        cell.title.text = self.topicList[indexPath.row].title
        cell.discription.text = self.topicList[indexPath.row].desc
        cell.imageView?.image = UIImage(named: self.images[indexPath.row])

        return cell
    }
    
    @IBAction func settingsBtnPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
        
    }
    
    // when row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppData.shared.selectedTopic = AppData.shared.topicList[indexPath.row]
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) {
    
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
