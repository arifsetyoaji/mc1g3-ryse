//
//  RepeatDayViewController.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class RepeatDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var repeatDaysTableView: UITableView!
    
    struct Day {
        var dd: String
        var selected: Bool = false
    }

    var days = [ Day(dd: "Sunday"),
                 Day(dd: "Monday"),
                 Day(dd: "Tuesday"),
                 Day(dd: "Wednesday"),
                 Day(dd: "Thursday"),
                 Day(dd: "Friday"),
                 Day(dd: "Saturday")
    ]
    
    var repeatDayIndex : [Int] = []
    var daySelected: [DayAlarm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repeatDaysTableView.delegate = self
        self.repeatDaysTableView.dataSource = self
        
        self.navigationController?.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repeatDaysCell", for: indexPath)
        
        let item = days[indexPath.row]
        
        cell.textLabel?.text = "Every \(item.dd )"
        cell.accessoryType = item.selected ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        days[indexPath.row].selected = !days[indexPath.row].selected
        
        if days[indexPath.row].selected {
            if !repeatDayIndex.contains(indexPath.row){
                repeatDayIndex.append(indexPath.row)
            }
            else {
                repeatDayIndex = repeatDayIndex.filter{$0 != indexPath.row}
            }
            
        } else {
            if repeatDayIndex.count != 0 {
//                repeatDay.remove(at: indexPath.row)
                repeatDayIndex = repeatDayIndex.filter{$0 != indexPath.row}
            }
            
        }
        
        print("repeat day \(repeatDayIndex)")
        
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if repeatDayIndex.contains(0){
            daySelected.append(.sunday)
        }
        if repeatDayIndex.contains(1){
            daySelected.append(.monday)
        }
        if repeatDayIndex.contains(2){
            daySelected.append(.tuesday)
        }
        if repeatDayIndex.contains(3){
            daySelected.append(.wednesday)
        }
        if repeatDayIndex.contains(4){
           daySelected.append(.thursday)
        }
        if repeatDayIndex.contains(5){
            daySelected.append(.friday)
        }
        if repeatDayIndex.contains(6){
           daySelected.append(.saturday)
        }

        print(daySelected)
            
        let dest = segue.destination as! AddAlarmViewController
            dest.dayAdded = daySelected
                  
            print("segue jalan dari repeat days")
    }
    
    
    
}
