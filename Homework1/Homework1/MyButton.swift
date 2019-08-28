//
//  MyButton.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 28/08/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

@IBDesignable class MyButton: UIButton {
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable var borderRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = borderRadius
        }
    }

}
