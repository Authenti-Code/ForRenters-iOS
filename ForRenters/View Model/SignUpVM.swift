//
//  SignUpVM.swift
//  ForRenters
//
//  Created by Pankush Mehra on 24/05/22.
//

import Foundation
import UIKit

class SignUpVM{
    func signUpApi(_ request: SignUp.Request,completion:@escaping() -> Void){
        let URL = "\(Apis.ServerUrl)\(Apis.signup)"
        var param = [String : Any]()
        param = [
            "first_name"   : request.firstname as AnyObject,
            "last_name"    : request.lastName as AnyObject,
            "email"        : request.email as AnyObject,
            "phone_number" : request.phone as AnyObject,
            "password"     : request.password as AnyObject,
            "c_password": request.confirmPassword as AnyObject,
            "device_id"    : UIDevice.current.identifierForVendor?.uuidString ?? "",
            "device_type"  : "IOS",
            "device_token":"xyy"
        ]
        print("Param:", param)
        WebProxy.shared.postData(URL, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    if let dataDic = JSON["data"] as? NSDictionary{
//                        Signup_step = dataDic["signup_step"] as? String  ?? ""
                        accessToken = dataDic["token"] as? String ?? ""
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
