//
//  ViewController.swift
//  DoIt
//
//  Created by William Pronovost on 12/14/16.
//  Copyright © 2016 William Pronovost. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    // var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: task)
    }
    
    
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("Nothing Here")
        }
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
           
            // Removing unneeded from CoreData
            // let nextVC = segue.destination as! AddTaskViewController
           // nextVC.previousVC = self
        }
        
        if segue.identifier == "detailSegue" {
            let nextVC = segue.destination as! DetailsViewController
            nextVC.task = sender as? Task
            // nextVC.previousVC = self
        }
    }
}

