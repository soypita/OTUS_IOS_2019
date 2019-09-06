//
//  SecondViewController.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 07/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showWithPop",
        let vc = segue.destination as? ThirdViewController else  {
            return
        }
        vc.shouldPopSecondVc = true
    }
}
