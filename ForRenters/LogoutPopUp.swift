//
//  LogoutPopUp.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import UIKit
protocol LogOutProtocol{
    func removelogoutObjPop(address:String)
}
class LogoutPopUp: UIViewController {
    @IBOutlet weak var oNoBtn: UIButton!
    @IBOutlet weak var oYesBtn: UIButton!
    var logoutObj: LogOutProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
        // Do any additional setup after loading the view.
    }
    @IBAction func oNoBtnAction(_ sender: Any) {
        self.dismiss(animated: false, completion:nil)
    }
    @IBAction func oYesBtnAction(_ sender: Any) {
        logOutApi{
        self.dismiss(animated: false, completion: {
        self.logoutObj?.removelogoutObjPop(address: "good")
        })
        }
    }
}
extension LogoutPopUp {
    //MARK:--> Hit LogOut Api Handling
    func logOutApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.logOut)"
        var param = [String : Any]()
        param = ["":""]
       print("param",param)
        WebProxy.shared.postData(Url, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    accessToken = ""
                    Signup_step = ""
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

