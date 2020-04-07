//
//  SoundModel.swift
//  mc1g3-ryse
//
//  Created by derry on 07/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import Foundation
import UIKit

struct SoundData {
    var fileName: String
    var selected: Bool = false
    
    init(fileName: String, selected: Bool) {
        self.fileName = fileName
        self.selected = selected
    }
}
