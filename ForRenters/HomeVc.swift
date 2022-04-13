//
//  HomeVc.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit
import GoogleMaps

class HomeVc: UIViewController {
//    @IBOutlet weak var mapView:GMSMapView!
    private let locationManager = CLLocationManager()
    var destinationMarker = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//                let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
//                self.view.addSubview(mapView)
//        let marker = GMSMarker()
//                marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//                marker.title = "Sydney"
//                marker.snippet = "Australia"
//                marker.map = mapView
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBarController?.tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.tabBarController?.tabBar.unselectedItemTintColor = .gray
        }
    }
