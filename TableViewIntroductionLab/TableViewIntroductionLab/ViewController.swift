//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskListTableView: UITableView!
    
    private var taskItems = [Task.allTasks] {
        didSet {
            taskListTableView.reloadData()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskListTableView.dataSource = self
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        let currentTask = taskItems[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = currentTask.name
        cell.detailTextLabel?.text = currentTask.dueDate.description
        
        
        return cell
    }
    
    
}
