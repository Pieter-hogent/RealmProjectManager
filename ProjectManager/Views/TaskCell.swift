//
//  TaskCell.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 12/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import UIKit

class TaskCell : UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    var task: Task! {
        didSet {
            nameLabel.text = task.name;
        }
    }
}
