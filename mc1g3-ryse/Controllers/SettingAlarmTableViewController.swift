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
    
    var alarmTime: String = ""
    
    var alarmArray: [String] = []
    
    var alarms = [
        DataAlarm(time: Date(), repeatDay: [.sunday, .monday, .friday], label: "ini alarm saya", sound: "Horn", ascending: true),
        DataAlarm(time: Date(), repeatDay: [.thursday, .saturday], label: "test", sound: "Horn", ascending: true)
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    @IBAction func unwindAddAlarm(sender: UIStoryboardSegue){
        
        if let present = sender.source as? AddAlarmViewController {

            let timePicked = present.timePicker.date
            let timeformat = DateFormatter()
            timeformat.dateFormat = "HH.mm"
            
            alarmTime = timeformat.string(from: timePicked)
            
            alarmArray.append(alarmTime)
            print("append alarm array \(alarmTime)")
        }
        
        saveAlarm()
        
    }
    
    func saveAlarm(){
        self.tableView.reloadData()
        print(alarmArray)
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarmArray.count //alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmViewCell else {
            fatalError("The dequeued cell is not an instance of SummaryTableViewCell.")
        }
        
        let alarmItem = alarmArray[indexPath.row] //alarms[indexPath.row]
//        let timeformat = DateFormatter()
//        var repeatdays: String = ""
        
//        timeformat.dateFormat = "HH.mm"
        
//        for x in alarmItem.repeatDay {
//            repeatdays.append(x.rawValue)
//            repeatdays.append(", ")
//        }
        
        cell.alarmTime.text = alarmItem //timeformat.string(from: Date())
//        cell.alarmDay.text = String(repeatdays.prefix(repeatdays.count - 2))
//        cell.alarmLabel.text = alarmItem.label
        
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
            
            self.alarmArray.remove(at: indexPath.row)
//            self.alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])

        return swipeActions
    }
    


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
