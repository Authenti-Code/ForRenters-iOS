//
//  ChangePasswordVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 15/04/22.
//

import UIKit

class ChangePasswordVc: UIViewController, BackToLogProtocol  {
    func removebacktoLogObjPop(addresss: String) {
        let vc = UIStoryboard(name: "Main", bundle:
                                nil).instantiateViewController(withIdentifier: "LogInVc") as! LogInVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var oNPasswordVw: UIView!
    @IBOutlet weak var CNPasswordVw: UIView!
    @IBOutlet weak var nPasswordEyeBtn: UIButton!
    @IBOutlet weak var nPasswordTF: UITextField!
    @IBOutlet weak var cNPasswordTF: UITextField!
    @IBOutlet weak var cNPasswordEyeBtn: UIButton!
    var nPassword = false
    var cNpassword = false
    var email = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
        // Do any additional setup after loading the view.
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nPasswordEyeBtnAction(_ sender: Any) {
        if nPassword == false{
            nPassword = true
            nPasswordTF.isSecureTextEntry = false
            nPasswordEyeBtn.setImage(UIImage(named: "password-show"), for: .normal)
        } else{
            nPassword = false
            nPasswordTF.isSecureTextEntry = true
            nPasswordEyeBtn.setImage(UIImage(named: "password-hide"), for: .normal)
        }
    }
    @IBAction func cNPasswordEyeBtnAction(_ sender: Any) {
        if cNpassword == false{
            cNpassword = true
            cNPasswordTF.isSecureTextEntry = false
            cNPasswordEyeBtn.setImage(UIImage(named: "password-show"), for: .normal)
        } else{
            cNpassword = false
            cNPasswordTF.isSecureTextEntry = true
            cNPasswordEyeBtn.setImage(UIImage(named: "password-hide"), for: .normal)
        }
    }
    @IBAction func saveBtnAction(_ sender: Any) {
        resetPasswordApi{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "BackLogInPopUp") as! BackLogInPopUp
        nav.backtoLogObj = self
        self.navigationController?.present(nav, animated: false, completion: nil)
        }
    }
}
extension ChangePasswordVc {
    //MARK:--> Hit resetPassword Api
    func resetPasswordApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.forgotPasswordReset)"
        var param = [String : Any]()
        param = ["email_phone_number": email as AnyObject,
                 "password"
                 :nPasswordTF.text as AnyObject,
                 "confirm_password":cNPasswordTF.text as AnyObject]
        print("param",param)
        WebProxy.shared.postData(Url, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    
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

