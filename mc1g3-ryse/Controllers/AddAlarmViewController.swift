//
//  AddAlarmViewController.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class AddAlarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UINavigationItem!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var settingAlarmTableView: UITableView!
    
    var alarmTimePicked = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicking()

        // Do any additional setup after loading the view.
    }
    
    func timePicking() {
        self.timePicker.datePickerMode = .time

        self.settingAlarmTableView.delegate = self
        self.settingAlarmTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "repeatCell", for: indexPath)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "toneCell", for: indexPath)
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "ascendingVolumeCell", for: indexPath)
            cell.selectionStyle = .none
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath)
            cell.selectionStyle = .none
        default:
            cell = UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
     return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is SettingAlarmTableViewController {
            
            //toPresent.alarmTime = timePicker.date
            print("prepare to present \(timePicker.date)")
        }
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
        print(alarmTimePicked)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
