//
//  ViewController.swift
//  ForRenters
//
//  Created by Authenticode on 21/03/22.
//
import UIKit

class LogInVc: UIViewController, ChooseSendProtocol {
    func removechooseSendOtpObjPop(mail: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPVerificationVc") as! OTPVerificationVc
        vc.emailAddres = mail
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK :-- Outlets
    @IBOutlet weak var oEmailTF: UITextField!
    @IBOutlet weak var oPasswordTF: UITextField!
    @IBOutlet weak var oPasswordVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var oAppleBtn: UIButton!
    @IBOutlet weak var oGoogleBtn: UIButton!
    @IBOutlet weak var oLogInBtn: UIButton!
    @IBOutlet weak var oPasswordEyeBtn: UIButton!
    let logInVMObj =  LogInVM()
    var showPassword = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
    }
    override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    // MARK :-- SignUp Button Action
    @IBAction func oSignUpBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVc") as! SignUpVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK :-- Password show and Hide Button Action 
    @IBAction func oEyeBtnAction(_ sender: Any) {
        if showPassword == false{
            showPassword = true
            oPasswordTF.isSecureTextEntry = false
            oPasswordEyeBtn.setImage(UIImage(named: "password-show"), for: .normal)
        } else{
            showPassword = false
            oPasswordTF.isSecureTextEntry = true
            oPasswordEyeBtn.setImage(UIImage(named: "password-hide"), for: .normal)
        }
    }
    // MARK :-- SignIn Button Action
    @IBAction func oLogInBtnAction(_ sender: Any) {
        logInVMObj.logInApi(mail: oEmailTF.text ?? "", password: oPasswordTF.text ?? ""){
            if  Signup_step == "0" ||  Signup_step == "1"{
                let nav = self.storyboard?.instantiateViewController(withIdentifier: "ChooseMethodPopUp") as! ChooseMethodPopUp
                nav.chooseSendOtpObj = self
                self.navigationController?.present(nav, animated: false, completion: nil)
            }
            else if Signup_step == "2"{
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarVC") as! CustomTabBarVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    @IBAction func forgotPasswordAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle:
                                nil).instantiateViewController(withIdentifier: "ForgotPasswordVc") as! ForgotPasswordVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
