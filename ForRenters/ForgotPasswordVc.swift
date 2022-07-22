//
//  ForgotPasswordVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 15/04/22.
//

import UIKit

class ForgotPasswordVc: UIViewController {
    // MARK :-- OutLets
    @IBOutlet weak var mailVw: UIView!
    @IBOutlet weak var mailTf: UITextField!
//    @IBOutlet weak var MailVw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mailVw.layer.shadowColor = UIColor.red.cgColor
        mailVw.layer.shadowOpacity = 0.1
        mailVw.layer.shadowRadius = 3.0
        mailVw.layer.shadowOffset = .zero
        mailVw.layer.masksToBounds = false
    }
    // MARK :-- Submit Button Action
    @IBAction func submitBtnAction(_ sender: Any) {
        sendOtpApi{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "VerificationOTPVc") as! VerificationOTPVc
            nav.email = self.mailTf.text ?? ""
            self.navigationController?.pushViewController(nav, animated: true)
        }
       
    }
    // MARK :-- Back Button Action
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension ForgotPasswordVc {
    //MARK:--> Hit send Otp (Forgot password Flow) Api
    func sendOtpApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.forgotPassword)"
        var param = [String : Any]()
        param = ["email_phone_number": mailTf.text ?? ""]
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
