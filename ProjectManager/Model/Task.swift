//
//  Task.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 11/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import Foundation
import RealmSwift

class Task : Object
{
    enum Status: String {
        case new = "New"
        case inProgress = "InProgress"
        case completed = "Completed"
        
        static let values: [Status] = [.new, .inProgress, .completed]
    }
    
    @objc dynamic var name = ""
    @objc dynamic var statusRaw = ""
    
    var status: Status {
        get {
            return Status(rawValue: statusRaw) ?? .new
        } set {
            statusRaw = newValue.rawValue
        }
    }
    
    convenience init(name: String, status: Status = .new) {
        self.init()
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
    
    override var description: String {
        return "\(name) \(status)"
    }
    
}
