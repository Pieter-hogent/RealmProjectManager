//
//  AddTaskViewController.swift
//  ProjectManager
//
//  Created by Pieter Van Der Helst on 15/11/2018.
//  Copyright © 2018 Pieter Van Der Helst. All rights reserved.
//

import UIKit

class AddTaskViewController: UITableViewController {
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var statusField: UIPickerView!
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let projectName = nameField.text else {
            print("ERROR unwinding without name set")
            return
        }
        self.task = Task(name: projectName, status: Task.Status.values[statusField.selectedRow(inComponent: 0)])
    }
}


extension AddTaskViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Task.Status.values.count
    }
}

extension AddTaskViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Task.Status.values[row].rawValue
    }
}
