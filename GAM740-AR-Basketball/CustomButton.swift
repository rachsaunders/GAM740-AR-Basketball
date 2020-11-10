//
//  CustomButton.swift
//  GAM740-AR-Basketball
//
//  Created by Rachel Saunders on 10/11/2020.
//

import UIKit

class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        customiseButtons()
    }
    
    func customiseButtons() {
        backgroundColor = UIColor.gray
        
        layer.cornerRadius = 10.0
        
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
}
