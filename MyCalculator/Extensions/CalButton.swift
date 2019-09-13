//
//  CalButton.swift
//  MyCalculator
//
//  Created by Harshal Wani on 18/07/19.
//  Copyright © 2019 Harshal Wani. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setButtonOverlay() {
        let button = self
        button.alpha = 0.7
    }
    func removeButtonOverlay() {
        let button = self
        button.alpha = 1.0
    }
}
