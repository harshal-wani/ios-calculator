//
//  SwitchDarkModeCell.swift
//  MyCalculator
//
//  Created by Harshal Wani on 24/07/19.
//  Copyright © 2019 Harshal Wani. All rights reserved.
//

import UIKit
import SwiftTheme

class SwitchDarkModeCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var nightIcon: UIImageView!
    @IBOutlet weak var nightSwitch: UISwitch!


    override func awakeFromNib() {
        super.awakeFromNib()
        theme_backgroundColor = GlobalPicker.backgroundColor
        title.theme_textColor = GlobalPicker.textColor
        nightIcon.theme_image = ["ic_dark", "ic_light"]
        
        updateNightSwitch()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateNightSwitch), name: NSNotification.Name(rawValue: ThemeUpdateNotification), object: nil)
    }
    
    @IBAction func changeNight(_ sender: UISwitch) {
        MyThemes.switchNight(isToNight: sender.isOn)
         MyThemes.saveLastTheme()
    }
    
    @objc private func updateNightSwitch() {
        nightSwitch.isOn = MyThemes.isNight()
    }

}
