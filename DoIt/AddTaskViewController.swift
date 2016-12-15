//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by William Pronovost on 12/14/16.
//  Copyright © 2016 William Pronovost. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    // var previousVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTask(_ sender: Any) {
        // Connect to AppDelegate
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Create a task
        
        
        let task = Task(context: context)
        task.name = taskName.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Add it to VC
        
        // previousVC.tasks.append(task)
        // previousVC.tableView.reloadData()
        
        // ^^ Updated with CoreData functionality
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
