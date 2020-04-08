//
//  AddAlarmViewController.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class AddAlarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate {

    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var settingAlarmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timePicker.datePickerMode = .time
//        timePicker.delegate =
        
        self.settingAlarmTableView.delegate = self
        self.settingAlarmTableView.dataSource = self

        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
