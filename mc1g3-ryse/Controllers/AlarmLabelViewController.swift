//
//  LabelViewController.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class AlarmLabelViewController: UIViewController {

    var labelAlarm = ""
    
    @IBOutlet weak var alarmLabelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            let dest = segue.destination as! AddAlarmViewController
            
            labelAlarm = alarmLabelTextField.text ?? ""
            
            print("label Alarm: \(labelAlarm)")
            dest.labelAlarm = labelAlarm
        
    }
    

}
