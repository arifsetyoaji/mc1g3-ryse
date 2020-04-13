//
//  OnboardVC.swift
//  mc1g3-ryse
//
//  Created by derry on 10/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit

class OnboardVC: UIViewController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
        
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func skipAction(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "isAppAlreadyLaunchedOnce")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func readyAction(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "isAppAlreadyLaunchedOnce")
        UserDefaults.standard.synchronize()
    }
}
