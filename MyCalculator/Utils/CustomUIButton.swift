//
//  CustomUIButton.swift
//  MyCalculator
//
//  Created by Harshal Wani on 18/07/19.
//  Copyright © 2019 Harshal Wani. All rights reserved.
//

import UIKit

class CustomUIButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = layer.frame.height / 2
        clipsToBounds = true
        print(self.frame)
        
    }
}
