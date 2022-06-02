//
//  ResetPasswordVc.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import UIKit

class ResetPasswordVc: UIViewController, SuccessPasswordPop {
    func removesuccessPasswordObjPop(address: String) {
        if let tabBarController = self.navigationController?.tabBarController  {
               tabBarController.selectedIndex = 3
     navigationController?.popToRootViewController(animated: true)
    }
    }
    // MARK :-- Outlets
    @IBOutlet weak var oOPasswordVw: UIView!
    @IBOutlet weak var oNPasswordVw: UIView!
    @IBOutlet weak var CNPasswordVw: UIView!
    @IBOutlet weak var oOPasswordEyeBtn: UIButton!
    @IBOutlet weak var oNPasswordEyeBtn: UIButton!
    @IBOutlet weak var oCNPasswordEyeBtn: UIButton!
    @IBOutlet weak var oOPasswordTF: UITextField!
    @IBOutlet weak var oNPasswordTF: UITextField!
    @IBOutlet weak var oCNPasswordTF: UITextField!
    // MARK :-- Define variables
    var opassword = false
    var npassword = false
    var cnpassword = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
        // Do any additional setup after loading the view.
    }
    // MARK :-- Back Button Action
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK :-- Old password text hide and show Button
    @IBAction func oOPasswordEyeBtnAction(_ sender: Any) {
        if opassword == false{
            opassword = true
            oOPasswordTF.isSecureTextEntry = false
            oOPasswordEyeBtn.setImage(UIImage(named: "password-show"), for: .normal)
        } else{
            opassword = false
            oOPasswordTF.isSecureTextEntry = true
            oOPasswordEyeBtn.setImage(UIImage(named: "password-hide"), for: .normal)
        }
    }
    // MARK :-- New password text hide and show Button
    @IBAction func oNPasswordEyeBtnAction(_ sender: Any) {
        if npassword == false{
            npassword = true
            oNPasswordTF.isSecureTextEntry = false
            oNPasswordEyeBtn.setImage(UIImage(named: "password-show"), for: .normal)
        } else{
            npassword = false
            oNPasswordTF.isSecureTextEntry = true
            oNPasswordEyeBtn.setImage(UIImage(named: "password-hide"), for: .normal)
        }
    }
    // MARK :-- Confirm New password text hide and show Button
    @IBAction func oCNPasswordEyeBtnAction(_ sender: Any) {
        if cnpassword == false{
            cnpassword = true
            oCNPasswordTF.isSecureTextEntry = false
            oCNPasswordEyeBtn.setImage(UIImage(named: "password-show"), for: .normal)
        } else{
            cnpassword = false
            oCNPasswordTF.isSecureTextEntry = true
            oCNPasswordEyeBtn.setImage(UIImage(named: "password-hide"), for: .normal)
        }
    }
    @IBAction func saveBtnAction(_ sender: Any) {
        if self.oNPasswordTF.text?.count ?? 0 < 8{
            Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.validPassword)
                            return
                        }
        else{
        passwordChangeApi{
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "SuccessPasswordPopUpVc") as! SuccessPasswordPopUpVc
    nav.successPasswordObj = self
    self.navigationController?.present(nav, animated: false, completion: nil)
        }
        }
    }
}
extension ResetPasswordVc {
    //MARK:--> Hit password Change Api
    func passwordChangeApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.changePassword)"
        var param = [String : Any]()
        param = ["current_password":oOPasswordTF.text ?? "",
                 "new_password":oNPasswordTF.text ?? "",
                 "confirm_new_password":oCNPasswordTF.text ?? ""
        ]
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
