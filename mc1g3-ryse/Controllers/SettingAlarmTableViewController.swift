//
//  SettingAlarmTableViewController.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UserNotifications
import UIKit

class SettingAlarmTableViewController: UITableViewController, UNUserNotificationCenterDelegate {
    
    var alarmArray: [Date] = []
    
    var alarms = [DataAlarm]()
    
    var notificationsArray = [NotificationModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerLocalNotification()
    }
    
    
    func registerLocalNotification(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted,
            Error in
            if granted {
                print("Yeay")
            } else {
                print("Oh no..")
            }
        }
    }

    @IBAction func unwindAddAlarm(sender: UIStoryboardSegue){
        
        if let present = sender.source as? AddAlarmViewController {

            let timePicked = present.timePicker.date
            let hari = present.dayAdded
            let label = present.labelAdded
            let tonePicked = present.toneAdded
            
            let jamFormat = DateFormatter()
            jamFormat.dateFormat = "HH"
            
            let menitFormat = DateFormatter()
            menitFormat.dateFormat = "mm"
            
            var dateComponents = DateComponents()
            dateComponents.hour = Int(jamFormat.string(from: timePicked))
            dateComponents.minute = Int(menitFormat.string(from: timePicked))
                        
            
            
            alarms.append(DataAlarm(time: timePicked, repeatDay: hari, label: label, sound: tonePicked, ascending: true))
            
            print("append alarm array \(timePicked), \(hari), \(tonePicked)")
            print("------------------------")
            
            notificationsArray.append(NotificationModel(title: label, soundName: tonePicked, datetime: dateComponents))
            print("append datetime notif array \(dateComponents)")
            print("soundName \(tonePicked)")

        }
        
        saveAlarm()
        
    }
    
    func saveAlarm(){
        self.tableView.reloadData()
        
        self.scheduledNotification()
//        self.listScheduledNotifications()
        
        print("Alarm Notif Data \(notificationsArray)")
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
            
            self.notificationsArray.remove(at: indexPath.row)
        }
        
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])

        return swipeActions
    }
    

}


extension SettingAlarmTableViewController {
    
    func listScheduledNotifications(){
        UNUserNotificationCenter.current().getPendingNotificationRequests {
            
            notificationsArray in
            
            for notification in notificationsArray {
                print(notification)
            }
        }
    }
    
    func scheduledNotification() {
        
        registerCategoryNotification()
        
        let center = UNUserNotificationCenter.current()
        
        for notification in notificationsArray {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.body = notification.title
            content.categoryIdentifier = "alarm"
            
            let soundFile = notification.soundName
            let soundName = soundFile.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            
            print(soundName)
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "\(soundName).mp3"))
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.datetime, repeats: false)
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            center.add(request) { Error in
                guard Error == nil else { return }
            }
            
        }
        
    }
    
    func registerCategoryNotification(){
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let snooze = UNNotificationAction(identifier: "show", title: "Open to Snooze Alarm", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [snooze], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
    }
    
    
}
