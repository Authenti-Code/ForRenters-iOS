//
//  OTPVerificationVc.swift
//  ForRenters
//
//  Created by Authenticode on 22/03/22.
//

import UIKit

class OTPVerificationVc: UIViewController,UITextFieldDelegate, SuccessProtocol {
    func removesuccessObj(address: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarVC") as! CustomTabBarVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var oTF1: UITextField!
    @IBOutlet weak var oTF2: UITextField!
    @IBOutlet weak var oTF3: UITextField!
    @IBOutlet weak var oTF4: UITextField!
    @IBOutlet weak var oVw1: UIView!
    @IBOutlet weak var oVw2: UIView!
    @IBOutlet weak var oVw3: UIView!
    @IBOutlet weak var oVw4: UIView!
    var emailAddres:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        oTF1.delegate = self
        oTF2.delegate = self
        oTF3.delegate = self
        oTF4.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    @IBAction func oVerifyOTPAction(_ sender: Any) {
        OtpVerifyMethod(otp: "\(oTF1.text ?? "")\(oTF2.text ?? "")\(oTF3.text ?? "")\(oTF4.text ?? "")"){
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "SuccessPopUp") as! SuccessPopUp
            nav.successObj = self
            self.navigationController?.present(nav, animated: false, completion: nil)
        }
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
extension OTPVerificationVc {
    //MARK:--> Hit Choose method For send OTP API
    func OtpVerifyMethod(otp:String?,completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.OtpVerification)"
        var param = [String : Any]()
        param = ["email":emailAddres as AnyObject,
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

