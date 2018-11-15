//
//  ProjectsViewController.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 11/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var projects: Array<Project>!
    
    override func viewDidLoad() {
        projects = Array<Project>()
        let project = Project(name: "first project")
        project.tasks.append(Task(name: "started", status: Task.Status.new))
        projects.append(project)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showProjectDetail":
            let projectDetailViewController = segue.destination as! ProjectDetailViewController
            projectDetailViewController.project = projects[tableView.indexPathForSelectedRow!.row]
        case "addNewProject":
            break
        default:
            fatalError("unknown segue")
        }
    }
    
    @IBAction func unwindFromAddProject(_ segue: UIStoryboardSegue) {
        if let addProjectViewController = segue.source as? AddProjectViewController {
            self.projects.append(addProjectViewController.project!)
            self.tableView.insertRows(at: [IndexPath(row: projects.count - 1, section: 0)], with: .automatic)
        }
    }
}

extension ProjectsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectCell
        cell.project = projects[indexPath.row]
        return cell
    }
    
    
}
