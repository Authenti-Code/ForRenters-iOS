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
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
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
extension OTPVerificationVc{
    func addShadow(){
        // MARK :-- oVw1 View Shadow
        oVw1.layer.shadowColor = UIColor.lightGray.cgColor
        oVw1.layer.shadowOpacity = 0.5
        oVw1.layer.shadowRadius = 2.5
        oVw1.layer.shadowOffset = .zero
        oVw1.layer.masksToBounds = false
        // MARK :-- oVw2 Shadow
        oVw2.layer.shadowColor = UIColor.lightGray.cgColor
        oVw2.layer.shadowOpacity = 0.5
        oVw2.layer.shadowRadius = 2.5
        oVw2.layer.shadowOffset = .zero
        oVw2.layer.masksToBounds = false
        // MARK :-- oVw3 View Shadow
        oVw3.layer.shadowColor = UIColor.lightGray.cgColor
        oVw3.layer.shadowOpacity = 0.5
        oVw3.layer.shadowRadius = 2.5
        oVw3.layer.shadowOffset = .zero
        oVw3.layer.masksToBounds = false
        // MARK :-- oVw4 View Shadow
        oVw4.layer.shadowColor = UIColor.lightGray.cgColor
        oVw4.layer.shadowOpacity = 0.5
        oVw4.layer.shadowRadius = 2.5
        oVw4.layer.shadowOffset = .zero
        oVw4.layer.masksToBounds = false
    }
}
