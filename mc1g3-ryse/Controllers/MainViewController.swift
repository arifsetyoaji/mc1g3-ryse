//
//  ViewController.swift
//  mc1g3-ryse
//
//  Created by Grace Cindy on 03/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let size:CGFloat = 44.5 // 35.0 chosen arbitrarily
        
        settingsLabel.layer.cornerRadius = size / 2
    }


}

