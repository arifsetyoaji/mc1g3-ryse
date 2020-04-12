//
//  RepeatDayViewController.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class RepeatDayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    var repeatDay : [Int] = []
    var teshari: [DayAlarm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.repeatDaysTableView.delegate = self
        self.repeatDaysTableView.dataSource = self
        
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
            if !repeatDay.contains(indexPath.row){
                repeatDay.append(indexPath.row)
            }
            else {
                repeatDay = repeatDay.filter{$0 != indexPath.row}
            }
            
        } else {
            if repeatDay.count != 0 {
//                repeatDay.remove(at: indexPath.row)
                repeatDay = repeatDay.filter{$0 != indexPath.row}
            }
            
        }
        
        print(repeatDay)
        
        
        tableView.reloadData()
        
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if repeatDay.contains(0){
            teshari.append(.sunday)
        }
        if repeatDay.contains(1){
            teshari.append(.monday)
        }
        if repeatDay.contains(2){
            teshari.append(.tuesday)
        }
        if repeatDay.contains(3){
            teshari.append(.wednesday)
        }
        if repeatDay.contains(4){
           teshari.append(.thursday)
        }
        if repeatDay.contains(5){
            teshari.append(.friday)
        }
        if repeatDay.contains(6){
           teshari.append(.saturday)
        }

        print(teshari)
            let dest = segue.destination as! AddAlarmViewController
            dest.terimahari = teshari
                  
            print("segue jalan")
    }
    

}
