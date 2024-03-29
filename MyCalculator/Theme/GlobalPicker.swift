//
//  GlobalPicker.swift
//  Demo
//
//  Created by Gesen on 16/3/1.
//  Copyright © 2016年 Gesen. All rights reserved.
//

import SwiftTheme

enum GlobalPicker {
    static let backgroundColor: ThemeColorPicker = ["#FFF", "#292b38"]
    static let textColor: ThemeColorPicker = ["#000", "#ECF0F1"]
    
    static let barTextColors = ["#000", "#FFF"]
    static let barTextColor = ThemeColorPicker.pickerWithColors(barTextColors)
    static let barTintColor: ThemeColorPicker = ["#FFF", "#292b38"]
}
