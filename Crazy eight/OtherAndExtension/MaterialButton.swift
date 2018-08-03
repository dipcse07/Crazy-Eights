//
//  MaterialButton.swift
//  Crazy eight
//
//  Created by MD.SAZID HASAN DIP on 13/11/17.
//  Copyright © 2017 MD.SAZID HASAN DIP. All rights reserved.
//

import Foundation
import UIKit

class MaterialButton: UIButton {
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 2.0
        
        layer.shadowColor = UIColor( red: SHADOW_COLOR, green: SHADOW_COLOR,blue: SHADOW_COLOR, alpha: 0.5).cgColor
        
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        
        layer.shadowOffset = CGSize.init(width: 0.0, height: 2.0)
        
        
    }
}

