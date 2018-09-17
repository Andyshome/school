//
//  MyTabBarViewController.swift
//  school
//
//  Created by Triad on 2018-04-27.
//  Copyright © 2018 Baraam. All rights reserved.
//

import UIKit
class MyTabBarViewController: UITabBarController {
// make sure the first page you see it the main page to login.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 2
    }

}
