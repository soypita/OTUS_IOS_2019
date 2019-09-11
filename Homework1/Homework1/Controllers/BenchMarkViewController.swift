//
//  BenchMarkViewController.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 05/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

class BenchMarkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors(behaviors: [TimerControllerBehavior()])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
