//
//  RoundedButton.swift
//  Calculate
//
//  Created by Антон Красиков on 08.11.2022.
//

import UIKit
@IBDesignable
class RoundedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var roundedButton: CGFloat = 0.0{
        didSet{ self.layer.cornerRadius = roundedButton}
        
    }
}
