//
//  NotificationModel.swift
//  mc1g3-ryse
//
//  Created by Muhammad Arif Setyo Aji on 13/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import Foundation


struct NotificationModel {
    var title: String
    var soundName: String
    var datetime: DateComponents
    
    init(title: String, soundName: String, datetime: DateComponents) {
        self.title = title
        self.soundName = soundName
        self.datetime = datetime
    }
}
