//
//  ThirdViewController.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 07/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var shouldPopSecondVc = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if shouldPopSecondVc {
            if let controllers = navigationController?.viewControllers {
                let filteredControllers = controllers.filter {!($0 is SecondViewController)}
                navigationController?.setViewControllers(filteredControllers, animated: true)
            }
        }
    }
}
