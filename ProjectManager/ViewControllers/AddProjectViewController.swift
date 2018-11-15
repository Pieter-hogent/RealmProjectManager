//
//  AddProjectViewController.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 12/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import UIKit


class AddProjectViewController : UITableViewController {
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    
    var project: Project?
    
    override func viewDidLoad() {
        self.saveButton.isEnabled = false;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let projectName = nameField.text else {
            print("ERROR unwinding without name set")
            return
        }
        self.project = Project(name: projectName)
    }
}

extension AddProjectViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            let oldText = text as NSString
            let newText = oldText.replacingCharacters(in: range, with: string)
            saveButton.isEnabled = newText.count > 0
        } else {
            saveButton.isEnabled = string.count > 0
        }
        return true;
    }
}
