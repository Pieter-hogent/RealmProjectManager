//
//  ProjectCell.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 11/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import UIKit

class ProjectCell : UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    var project: Project! {
        didSet {
            nameLabel.text = project.name;
        }
    }
}
