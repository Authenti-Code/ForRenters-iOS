//
//  ForgotPasswordVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 15/04/22.
//

import UIKit

class ForgotPasswordVc: UIViewController {
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
    @IBAction func submitBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle:
        nil).instantiateViewController(withIdentifier: "VerificationOTPVc") as! VerificationOTPVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
