//
//  MenuTableViewController.swift
//  MyCalculator
//
//  Created by Harshal Wani on 23/07/19.
//  Copyright © 2019 Harshal Wani. All rights reserved.
//

import UIKit
import SwiftTheme

class MenuTableViewController: UITableViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var themeSwitch: UISwitch!
    
    //MARK:- Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.theme_backgroundColor = GlobalPicker.backgroundColor
    }
    
    //MARK:- Action events method
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        MyThemes.switchNight(isToNight: sender.isOn)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if MyThemes.isNight() == true {
            return .lightContent
        }
        return .default
    }
}
