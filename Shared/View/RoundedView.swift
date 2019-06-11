//
//  RoundedView.swift
//  Artable
//
//  Created by AhMeD on 6/11/19.
//  Copyright © 2019 AhMeD. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton:UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5.0
    }
}
class RoundedShadowView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5.0
        layer.shadowColor = AppColors.Blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3.0
    }
}
class RoundedImageView:UIImageView{
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5.0
    }
    
}
