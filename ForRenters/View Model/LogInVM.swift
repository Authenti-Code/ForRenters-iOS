//
//  LogInVM.swift
//  ForRenters
//
//  Created by Pankush Mehra on 24/05/22.
//

import Foundation
import UIKit

class LogInVM{
    func logInApi(mail:String,password: String,completion:@escaping() -> Void){
        let URL = "\(Apis.ServerUrl)\(Apis.logIn)"
        var param = [String : Any]()
        param = [
            "email_phone_number" : mail as AnyObject,
            "password"     : password as AnyObject,
            "device_id" : UIDevice.current.identifierForVendor?.uuidString ?? "",
            "device_type"  : "IOS"
        ]
        print("Param:", param)
        WebProxy.shared.postData(URL, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    if let dataDic = JSON["data"] as? NSDictionary{
                        Signup_step = dataDic["signup_step"] as? String  ?? ""
                        accessToken = dataDic["device_token"] as? String ?? ""
                        userdataObj.datadict(data:dataDic)
                    }
                        completion()
                } else{
                    Proxy.shared.displayStatusCodeAlert(JSON["errorMessage"] as? String ?? "")
                }
            } else {
                Proxy.shared.displayStatusCodeAlert(message)
            }
        }
}
}


