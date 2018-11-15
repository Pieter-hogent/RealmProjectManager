//
//  Task.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 11/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import Foundation

class Task
{
    enum Status: String {
        case new = "New"
        case inProgress = "InProgress"
        case completed = "Completed"
        
        static let values: [Status] = [.new, .inProgress, .completed]
    }
    
    var name = ""
    var status: Status = .new
    
    init(name: String, status: Status = .new) {
        self.name = name
        self.status = status
    }
    
    func advance() {
        switch status {
        case .new:
            status = .inProgress
        case .inProgress:
            status = .completed
        default:
            status = .completed
        }
    }
}
