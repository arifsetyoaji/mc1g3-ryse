//
//  SettingAlarmTableViewController.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class SettingAlarmTableViewController: UITableViewController {
    
    
//    struct Alarm {
//        var time: String
//        var repeatday: String
//        var label: String
//    }
//
//
//    var alarms = [
//        Alarm(time: "06.00 AM", repeatday: "Sun, Mon, Tues", label: "Wake Me Up, when Sept .."),
//        Alarm(time: "06.05 AM", repeatday: "Sun, Mon, Tues", label: "Wake Up !!!"),
//        Alarm(time: "06.10 AM", repeatday: "Sun, Mon, Tues", label: "Please Wake Me Up"),
//    ]
    
    var alarmArray: [Date] = []
    
    var alarms = [DataAlarm]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func unwindAddAlarm(sender: UIStoryboardSegue){
        
        if let present = sender.source as? AddAlarmViewController {

            let timePicked = present.timePicker.date
            let hari = present.dayAdded
            let label = present.labelAdded
            let tonePicked = present.toneAdded
            
            alarms.append(DataAlarm(time: timePicked, repeatDay: hari, label: label, sound: tonePicked, ascending: true))
            
            print("append alarm array \(timePicked), \(hari), \(tonePicked)")

        }
        
        saveAlarm()
        
    }
    
    func saveAlarm(){
        self.tableView.reloadData()
        print(alarms)
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarms.count //alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmViewCell else {
            fatalError("The dequeued cell is not an instance of SummaryTableViewCell.")
        }
        
        let alarmItem = alarms[indexPath.row] //alarms[indexPath.row]
        let timeformat = DateFormatter()
        timeformat.dateFormat = "HH.mm"
        
        var repeatdays: String = ""
        
        for x in alarmItem.repeatDay {
            repeatdays.append(x?.rawValue ?? "")
            repeatdays.append(", ")
        }
        
        cell.alarmTime.text = timeformat.string(from: alarmItem.time)
        
        if !repeatdays.isEmpty {
            cell.alarmDay.text = String(repeatdays.prefix(repeatdays.count - 2))
        } else {
            cell.alarmDay.text = "Just Once"
        }
        
        cell.alarmLabel.text = alarmItem.label
        
        tableView.rowHeight = 110
        
        cell.selectionStyle = .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            //Code I want to do here
            print("Edit Alarm Cell")
        
        }
        editAction.backgroundColor = UIColor.gray
        
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            //Code I want to do here
            
            self.alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])

        return swipeActions
    }
    

}
