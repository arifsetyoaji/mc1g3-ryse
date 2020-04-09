//
//  ViewController.swift
//  mc1g3-ryse
//
//  Created by Grace Cindy on 03/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

struct FactsData {
    var fact: String
    var factBy: String
    
    init(fact: String, factBy: String) {
        self.fact = fact
        self.factBy = factBy
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet var dayLabels: [UILabel]!
    @IBOutlet weak var factsLabel: UILabel!
    @IBOutlet weak var factsByLabel: UILabel!
    @IBOutlet weak var nextAlarmLabel: UILabel!
    
    let factsList = [
        FactsData(fact: "People who are naturally early risers are less likely to develop mental health problems than “night owls”.", factBy: "https://www.theguardian.com"),
        FactsData(fact: "Early to bed and early to rise makes a man healthy, wealthy and wise” – Benjamin Franklin", factBy: "https://neurotracker.net"),
        FactsData(fact: "Being an Early Riser can helps your Skin Look Healthy", factBy: "https://neurotracker.net"),
        FactsData(fact: "Being an Early Riser may be less stressed and have more positivity in their lives", factBy: "https://neurotracker.net"),
        FactsData(fact: "Starting your day early improves your concentration", factBy: "https://www.sleepadvisor.org/")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size:CGFloat = 44.5 // 35.0 chosen arbitrarily
        
        settingButton.layer.cornerRadius = size / 2
        
        //set dayLabels
        for index in 0...6 {
            dayLabels[index].layer.borderWidth = 1
            dayLabels[index].layer.borderColor = UIColor.init(hex: 0xAFC3CC).cgColor
        }
        
        //random facts
        let randomFacts = Int.random(in: 0..<factsList.count)
        
        factsLabel.text = factsList[randomFacts].fact
        factsByLabel.text = factsList[randomFacts].factBy
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationBar?.shadowImage = UIImage()
        
    }
}

extension UIColor {
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
}
