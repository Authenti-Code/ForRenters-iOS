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
    override func viewDidLoad() {
        super.viewDidLoad()
        oTF1.delegate = self
        oTF2.delegate = self
        oTF3.delegate  = self
        oTF4.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func oVerifyOTPAction(_ sender: Any) {
        let nav = storyboard?.instantiateViewController(withIdentifier: "SuccessPopUp") as! SuccessPopUp
        nav.successObj = self
        self.navigationController?.present(nav, animated: false, completion: nil)
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
