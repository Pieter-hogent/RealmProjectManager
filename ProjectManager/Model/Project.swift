//
//  Project.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 11/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import UIKit

class Project {
    var name = ""
    var tasks = Array<Task>();
    
    init(name: String) {
        self.name = name;
    }
    
    func numberOfTasks(for status: Task.Status) -> Int {
        return tasks(for: status).count
    }
    
    func tasks(for status: Task.Status) -> Array<Task> {
        return tasks.filter() { $0.status == status }
    }
}
