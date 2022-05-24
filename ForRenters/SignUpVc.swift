//
//  ViewController.swift
//  ForRenters
//
//  Created by Authenticode on 22/03/22.
//

import UIKit

class SignUpVc: UIViewController, ChooseSendProtocol {
    func removechooseSendOtpObjPop(mail: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPVerificationVc") as! OTPVerificationVc
           vc.emailAddres = mail
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var oFNameVw: UIView!
    @IBOutlet weak var oLNameVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var oPhoneVw: UIView!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var LastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var oPasswordVw: UIView!
    @IBOutlet weak var oCPasswordVw: UIView!
    let signUpVMObj =  SignUpVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
    }
    @IBAction func oSignUpBtnAction(_ sender: Any) {
        let signRequest = SignUp.Request(firstname: firstNameTF.text?.trimmed(),lastName: LastNameTF.text?.trimmed(), email: emailTF.text?.trimmed(),phone:phoneTF.text?.trimmed(), password: passwordTF.text?.trimmed(), confirmPassword:confirmPasswordTF.text?.trimmed())
        signUpVMObj.signUpApi(signRequest){
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "ChooseMethodPopUp") as! ChooseMethodPopUp
        nav.chooseSendOtpObj = self
        self.navigationController?.present(nav, animated: false, completion: nil)
}
    }
    // MARK :-- SignIn Button Action
    @IBAction func oSignInBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogInVc") as! LogInVc
        self.navigationController?.pushViewController(vc, animated: true)
}
    @IBAction func passwordEyeBtnAction(_ sender: Any) {
    }
    @IBAction func cPasswordEyeBtnAction(_ sender: Any) {
    }
}

