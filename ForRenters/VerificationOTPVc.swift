//
//  VerificationOTPVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 15/04/22.
//

import UIKit

class VerificationOTPVc: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var oTF1: UITextField!
    @IBOutlet weak var oTF2: UITextField!
    @IBOutlet weak var oTF3: UITextField!
    @IBOutlet weak var oTF4: UITextField!
    @IBOutlet weak var oVw1: UIView!
    @IBOutlet weak var oVw2: UIView!
    @IBOutlet weak var oVw3: UIView!
    @IBOutlet weak var oVw4: UIView!
    var email = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        oTF1.delegate = self
        oTF2.delegate = self
        oTF3.delegate = self
        oTF4.delegate = self
    }
    @IBAction func oVerifyOTPAction(_ sender: Any) {
        otpVerifyApi(otp: "\(oTF1.text ?? "")\(oTF2.text ?? "")\(oTF3.text ?? "")\(oTF4.text ?? "")"){
            
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVc") as! ChangePasswordVc
            nav.email = self.email
            self.navigationController?.pushViewController(nav, animated: true)
        }
}
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
            // Range.length == 1 means,clicking backspace
        if (range.length == 0){
            if textField == oTF1 {
                oTF2?.becomeFirstResponder()
            }
            if textField == oTF2 {
                oTF3?.becomeFirstResponder()
            }
            if textField == oTF3 {
                oTF4?.becomeFirstResponder()
                let otp = "\((oTF1?.text)!)\((oTF2?.text)!)\((oTF3?.text)!)\((oTF4?.text)!)\(string)"
            }
            textField.text? = string
            return false
        }else if (range.length == 1) {
                if textField == oTF4 {
                                    oTF3?.becomeFirstResponder()
                }
                if textField == oTF3 {
                                    oTF2?.becomeFirstResponder()
                }
                if textField == oTF2 {
                                    oTF1?.becomeFirstResponder()
                }
                if textField == oTF1 {
                                    oTF1?.resignFirstResponder()
                }
                textField.text? = ""
                return false
        }
        return true
        }
}
extension VerificationOTPVc {
    //MARK:--> Hit verify OTP api
    func otpVerifyApi(otp:String?,completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.forgotPasswordVerifyOtp)"
        var param = [String : Any]()
        param = ["email_phone_number":email as AnyObject,
                 "otp":otp as AnyObject]
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
