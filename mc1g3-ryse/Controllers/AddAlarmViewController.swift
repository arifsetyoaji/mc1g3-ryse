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
    
    var labelAdded: String = ""
    var toneAdded: String = ""
    var dayAdded: [DayAlarm] = []
    
//    var dayArray = DayData()
    
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
        
        var repeatdays: String = ""
        
        for x in dayAdded {
            repeatdays.append(x.rawValue)
            repeatdays.append(", ")
        }
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "repeatCell", for: indexPath)
            
            if !repeatdays.isEmpty {
                cell.detailTextLabel?.text = String(repeatdays.prefix(repeatdays.count - 2))
            } else {
                cell.detailTextLabel?.text = "Never"
            }
            //dayArray.array.joined(separator: ", ")
            
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
            cell.detailTextLabel?.text = labelAdded
            
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "toneCell", for: indexPath)
            cell.detailTextLabel?.text = toneAdded
            
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
//        if segue.destination is SettingAlarmTableViewController {
//            //toPresent.alarmTime = timePicker.date
//            print("prepare to present \(timePicker!)")
//        }
        
//        if let repeatDayVC = segue.source as? RepeatDayViewController {
//            day = repeatDayVC.daySelected
//        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func unwindAfterSettingAlarm(sender: UIStoryboardSegue){
        
        if let repeatDayVC = sender.source as? RepeatDayViewController {
            dayAdded = repeatDayVC.daySelected
            print("segue source repeatday \(dayAdded)")
        }
        
        if let toneVC = sender.source as? SoundController {
            toneAdded = toneVC.selectSoundName!
            print("selected tone \(toneAdded)")
        }
        
        if let labelVC = sender.source as? AlarmLabelViewController {
            labelAdded = labelVC.label
        }
        
        settingAlarmTableView.reloadData()
    }

}
