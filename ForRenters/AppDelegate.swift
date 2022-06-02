//
//  AppDelegate.swift
//  ForRenters
//
//  Created by Authenticode on 22/03/22.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.all
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 2)
        GMSServices.provideAPIKey("AIzaSyCMxlBBdK_NSXwvNeH51vLDGbOwIoi-y2Q")
        AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        window?.overrideUserInterfaceStyle = .light
        if accessToken == "" && Signup_step == ""{
            RootControllerProxy.shared.rootWithDrawer("LogInVc")
        }
        if accessToken != "" && Signup_step == "2"{
            RootControllerProxy.shared.rootWithDrawer("CustomTabBarVC")
        }
        else{
        }
        return true
    }
}
    struct AppUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }

}
