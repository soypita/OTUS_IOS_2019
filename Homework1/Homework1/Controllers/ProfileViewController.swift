//
//  ProfileViewController.swift
//  Homework1
//
//  Created by Дмитрий Сазонов on 05/09/2019.
//  Copyright © 2019 Дмитрий Сазонов. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addBehaviors(behaviors: [ChangeBlackColorBehavior()])
    }
}
