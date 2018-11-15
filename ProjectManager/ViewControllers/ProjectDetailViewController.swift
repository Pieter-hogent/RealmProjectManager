//
//  ProjectDetailViewController.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 11/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var projectName: UINavigationItem!
    
    var project: Project!
    
    override func viewDidLoad() {
        projectName.title = project.name
    }
    
    @IBAction func unwindFromAddTask(_ segue: UIStoryboardSegue) {
        if let addTaskViewController = segue.source as? AddTaskViewController {
            let newTask = addTaskViewController.task!
            self.project.tasks.append(newTask)
            self.tableView.insertRows(at: [IndexPath(row: self.project.numberOfTasks(for: newTask.status) - 1,
                                                     section: Task.Status.values.index(of: newTask.status)!)],
                                      with: .automatic)

        }
    }
}

extension ProjectDetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Task.Status.values.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Task.Status.values[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project.tasks(for: Task.Status.values[section]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        cell.task = project.tasks(for: Task.Status.values[indexPath.section])[indexPath.row]
        return cell
    }
}

extension ProjectDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let modifyAction = UIContextualAction(style: .normal, title:  "Advance", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let task = self.project.tasks(for: Task.Status.values[indexPath.section])[indexPath.row]
            task.advance()
            self.tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: Task.Status.values.index(of: task.status)!))
            success(true)
        })
        modifyAction.backgroundColor = UIColor(red: 48/255.0, green: 193/255.0, blue: 204/255.0, alpha: 1.0)
        
        
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
}
