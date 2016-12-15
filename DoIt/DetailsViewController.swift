//
//  DetailsViewController.swift
//  DoIt
//
//  Created by William Pronovost on 12/14/16.
//  Copyright © 2016 William Pronovost. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var taskDetails: UILabel!
    
    // var previousVC = ViewController()
    
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        if task!.important {
            
        taskDetails?.text = "❗️\(task!.name!)"
        
    
        } else {
            taskDetails?.text = task!.name!
        }
    }
    
    @IBAction func completedTask(_ sender: Any) {
       // previousVC.tasks.remove(at: previousVC.selectedIndex)
       // previousVC.tableView.reloadData()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
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
