//
//  HomeVc.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit
import GoogleMaps

class HomeVc: UIViewController ,CLLocationManagerDelegate, GMSMapViewDelegate{
    @IBOutlet weak var mapView:GMSMapView!
    @IBOutlet weak var oSearch1Vw:UIView!
    @IBOutlet weak var oSearch1TF:UITextField!
    @IBOutlet weak var oSearch2Vw:UIView!
    @IBOutlet weak var oSearch2TF:UITextField!
    var locationManager = CLLocationManager()
//    var didFindMyLocation = false
    override func viewDidLoad() {
        super.viewDidLoad()
        oSearch1Vw.layer.shadowColor = UIColor.red.cgColor
        oSearch1Vw.layer.shadowOpacity = 0.4
        oSearch1Vw.layer.shadowRadius = 8.0
        oSearch1Vw.layer.shadowOffset = .zero
        oSearch1Vw.layer.masksToBounds = false
//        oSearch2Vw.layer.shadowColor = UIColor.red.cgColor
//        oSearch2Vw.layer.shadowOpacity = 0.4
//        oSearch2Vw.layer.shadowRadius = 8.0
//        oSearch2Vw.layer.shadowOffset = .zero
//        oSearch2Vw.layer.masksToBounds = false
                initializeTheLocationManager()
                self.mapView.isMyLocationEnabled = true
    }
    @IBAction func oSearchBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OverallRieviewVC") as! OverallRieviewVC
        self.navigationController?.pushViewController(vc, animated: false)
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBarController?.tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.tabBarController?.tabBar.unselectedItemTintColor = .gray
        
        }
    func initializeTheLocationManager() {
           locationManager.delegate = self
           locationManager.requestWhenInUseAuthorization()
           locationManager.startUpdatingLocation()
       }
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           var location = locationManager.location?.coordinate
           cameraMoveToLocation(toLocation: location)
       }
       func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
           if toLocation != nil {
               mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
           }
       }
}
