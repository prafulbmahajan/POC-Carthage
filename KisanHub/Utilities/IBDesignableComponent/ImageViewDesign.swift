//
//  ImageViewDesign.swift
//  KisanHub
//
//  Created by Praful Mahajan on 11/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class DesignableImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor? = UIColor.clear{
        didSet {
            layer.borderColor = self.borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor?.cgColor
    }
    
    func showBottomShadow (height : Int, color : UIColor) {
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = color.cgColor
    }
}
