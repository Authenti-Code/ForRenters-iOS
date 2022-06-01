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
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 2)
        GMSServices.provideAPIKey("AIzaSyCMxlBBdK_NSXwvNeH51vLDGbOwIoi-y2Q")
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

