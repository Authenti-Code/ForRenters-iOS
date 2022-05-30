//
//  ChooseMethodPopUp.swift
//  ForRenters
//
//  Created by Authenticode on 22/03/22.
//

import UIKit

protocol ChooseSendProtocol{
    func removechooseSendOtpObjPop(mail: String)
}
class ChooseMethodPopUp: UIViewController {
    @IBOutlet weak var oMainVw: UIView!
    @IBOutlet weak var oPhoneVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var ophoneLbl: UILabel!
    @IBOutlet weak var oEmailLbl: UILabel!
    @IBOutlet weak var oPhoneImg: UIImageView!
    @IBOutlet weak var oEmailImg: UIImageView!
    var chooseSendOtpObj:ChooseSendProtocol?
    var phone:Bool = false
    var Email:Bool = false
    var email:String?
    var phoneNumber:String?
    var method:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        Email = true
        phone = false
        method = "email"
        oEmailImg.image = UIImage(named: "email-white")
        email = userdataObj.email
        oEmailVw.layer.backgroundColor = UIColor.black.cgColor
        oPhoneVw.layer.backgroundColor = UIColor.unselectColor.cgColor
        ophoneLbl.textColor = UIColor.black
        oEmailLbl.textColor = UIColor.white
        oMainVw.roundCorners([.topLeft , .topRight], radius: 35)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    @IBAction func oContinueBtnAction(_ sender: Any) {
        chooseSignUp{
        self.dismiss(animated: true, completion: {
            self.chooseSendOtpObj?.removechooseSendOtpObjPop(mail: self.email ?? "")
        })
        }
}
    @IBAction func oPhoneBtnAction(_ sender: Any) {
            phone = true
            Email = false
            oPhoneVw.layer.backgroundColor = UIColor.black.cgColor
            oEmailVw.layer.backgroundColor = UIColor.unselectColor.cgColor
           oPhoneImg.image = UIImage(named: "phone-white")
           oEmailImg.image = UIImage(named: "mail")
           ophoneLbl.textColor = UIColor.white
           oEmailLbl.textColor = UIColor.black
        }
    @IBAction func oEmailBtnAction(_ sender: Any) {
        Email = true
        phone = false
        method = "email"
        email = userdataObj.email
        oEmailVw.layer.backgroundColor = UIColor.black.cgColor
        oPhoneVw.layer.backgroundColor = UIColor.unselectColor.cgColor
        oEmailImg.image = UIImage(named: "email-white")
        oPhoneImg.image = UIImage(named: "phone-black")
        ophoneLbl.textColor = UIColor.black
        oEmailLbl.textColor = UIColor.white
}
}
extension ChooseMethodPopUp {
    //MARK:--> Hit Choose method For send OTP API
    func chooseSignUp(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.chooseSignUpStep)"
        var param = [String : Any]()
        param = ["verification_method":method as AnyObject,
                 "email":email as AnyObject]
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

