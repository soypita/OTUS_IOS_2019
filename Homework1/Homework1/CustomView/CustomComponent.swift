//
//  CustomComponent.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 28/08/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

@IBDesignable class CustomComponent: UIView {
   
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        if let nib = Bundle.main.loadNibNamed(String(describing: CustomComponent.self),
                                              owner: nil,
                                              options: nil),
            let view = nib[0] as? UIView {
            addSubview(view)
        }
    }
}
