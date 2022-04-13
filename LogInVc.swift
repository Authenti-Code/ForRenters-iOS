//
//  ViewController.swift
//  ForRenters
//
//  Created by Authenticode on 21/03/22.
//
import UIKit

class LogInVc: UIViewController {
    // MARK :-- Outlets
    @IBOutlet weak var oEmailTF: UITextField!
    @IBOutlet weak var oPasswordTF: UITextField!
    @IBOutlet weak var oPasswordVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var oAppleBtn: UIButton!
    @IBOutlet weak var oGoogleBtn: UIButton!
    @IBOutlet weak var oLogInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
        // Do any additional setup after loading the view.
    }
    // MARK :-- SignUp Button Action
    @IBAction func oSignUpBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVc") as! SignUpVc
        self.navigationController?.pushViewController(vc, animated: true)
}
    // MARK :-- SignIn Button Action
    @IBAction func oLogInBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarVC") as! CustomTabBarVC
        self.navigationController?.pushViewController(vc, animated: true)
}
}
extension LogInVc{
    func addshadow(){
        // MARK :-- Email View Shadow
        oEmailVw.layer.shadowColor = UIColor.red.cgColor
        oEmailVw.layer.shadowOpacity = 0.1
        oEmailVw.layer.shadowRadius = 3.0
        oEmailVw.layer.shadowOffset = .zero
        oEmailVw.layer.masksToBounds = false
        // MARK :-- Password View Shadow
        oPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oPasswordVw.layer.shadowOpacity = 0.1
        oPasswordVw.layer.shadowRadius = 3.0
        oPasswordVw.layer.shadowOffset = .zero
        oPasswordVw.layer.masksToBounds = false
        // MARK :-- Apple Button Shadow
        oAppleBtn.layer.shadowColor = UIColor.red.cgColor
        oAppleBtn.layer.shadowOpacity = 0.2
        oAppleBtn.layer.shadowRadius = 3.0
        oAppleBtn.layer.shadowOffset = .zero
        oAppleBtn.layer.masksToBounds = false
        // MARK :-- Google Button Shadow
        oGoogleBtn.layer.shadowColor = UIColor.red.cgColor
        oGoogleBtn.layer.shadowOpacity = 0.2
        oGoogleBtn.layer.shadowRadius = 3.0
        oGoogleBtn.layer.shadowOffset = .zero
        oGoogleBtn.layer.masksToBounds = false
        // MARK :-- LogIn Button Shadow
        oLogInBtn.layer.shadowColor = UIColor.red.cgColor
        oLogInBtn.layer.shadowOpacity = 0.4
        oLogInBtn.layer.shadowRadius = 3.0
        oLogInBtn.layer.shadowOffset = .zero
        oLogInBtn.layer.masksToBounds = false
    }
}
