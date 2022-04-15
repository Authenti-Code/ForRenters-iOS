//
//  ViewController.swift
//  ForRenters
//
//  Created by Authenticode on 22/03/22.
//

import UIKit

class SignUpVc: UIViewController, ChooseSendProtocol {
    func removechooseSendOtpObjPop(address: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPVerificationVc") as! OTPVerificationVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var oFNameVw: UIView!
    @IBOutlet weak var oLNameVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var oPhoneVw: UIView!
    @IBOutlet weak var oPasswordVw: UIView!
    @IBOutlet weak var oCPasswordVw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        // Do any additional setup after loading the view.
    }
    @IBAction func oSignUpBtnAction(_ sender: Any) {
        let nav = storyboard?.instantiateViewController(withIdentifier: "ChooseMethodPopUp") as! ChooseMethodPopUp
        nav.chooseSendOtpObj = self
        self.navigationController?.present(nav, animated: false, completion: nil)
}
    // MARK :-- SignIn Button Action
    @IBAction func oSignInBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogInVc") as! LogInVc
        self.navigationController?.pushViewController(vc, animated: true)
}
}
extension SignUpVc{
    func addShadow(){
        // MARK :-- First Name View Shadow
        oFNameVw.layer.shadowColor = UIColor.red.cgColor
        oFNameVw.layer.shadowOpacity = 0.1
        oFNameVw.layer.shadowRadius = 3.0
        oFNameVw.layer.shadowOffset = .zero
        oFNameVw.layer.masksToBounds = false
        // MARK :-- Last NameView Shadow
        oLNameVw.layer.shadowColor = UIColor.red.cgColor
        oLNameVw.layer.shadowOpacity = 0.1
        oLNameVw.layer.shadowRadius = 3.0
        oLNameVw.layer.shadowOffset = .zero
        oLNameVw.layer.masksToBounds = false
        // MARK :-- Email View Shadow
        oEmailVw.layer.shadowColor = UIColor.red.cgColor
        oEmailVw.layer.shadowOpacity = 0.1
        oEmailVw.layer.shadowRadius = 3.0
        oEmailVw.layer.shadowOffset = .zero
        oEmailVw.layer.masksToBounds = false
        // MARK :-- Phone View Shadow
        oPhoneVw.layer.shadowColor = UIColor.red.cgColor
        oPhoneVw.layer.shadowOpacity = 0.1
        oPhoneVw.layer.shadowRadius = 3.0
        oPhoneVw.layer.shadowOffset = .zero
        oPhoneVw.layer.masksToBounds = false
        // MARK :-- Password View Shadow
        oPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oPasswordVw.layer.shadowOpacity = 0.1
        oPasswordVw.layer.shadowRadius = 3.0
        oPasswordVw.layer.shadowOffset = .zero
        oPasswordVw.layer.masksToBounds = false
        // MARK :-- Confirm Password View Shadow
        oCPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oCPasswordVw.layer.shadowOpacity = 0.1
        oCPasswordVw.layer.shadowRadius = 3.0
        oCPasswordVw.layer.shadowOffset = .zero
        oCPasswordVw.layer.masksToBounds = false
    }
}
