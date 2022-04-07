//
//  HomeVc.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit

class HomeVc: UIViewController {
//    @IBOutlet weak var mapView:GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBarController?.tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.tabBarController?.tabBar.unselectedItemTintColor = .gray
    }
}
