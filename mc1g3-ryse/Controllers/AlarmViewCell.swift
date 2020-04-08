//
//  AlarmViewCell.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 08/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class AlarmViewCell: UITableViewCell {

    
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmDay: UILabel!
    @IBOutlet weak var alarmLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func alarmSwitch(_ sender: UISwitch) {
        
        print("\(sender) Alarm is Disable")
    }
    
}
