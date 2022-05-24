//
//  CustomTabBarVC.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit

class CustomTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
