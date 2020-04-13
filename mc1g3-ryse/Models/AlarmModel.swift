//
//  AlarmModel.swift
//  mc1g3-ryse
//
//  Created by Griffin on 09/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import Foundation
import UIKit

enum DayAlarm: String, CaseIterable {
    case monday = "Mon"
    case tuesday = "Tue"
    case wednesday = "Wed"
    case thursday = "Thu"
    case friday = "Fri"
    case saturday = "Sat"
    case sunday = "Sun"
    case never
}

struct DataAlarm {
    var time: Date
    var repeatDay: [DayAlarm?] = []
    var label: String?
    var sound: String = ""
    var ascending: Bool = false
    
    init(time: Date, repeatDay: [DayAlarm], label: String, sound: String, ascending: Bool) {
        self.time = time
        self.repeatDay = repeatDay
        self.label = label
        self.sound = sound
        self.ascending = ascending
    }
}
