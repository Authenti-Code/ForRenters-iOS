//
//  ChooseMethodPopUp.swift
//  ForRenters
//
//  Created by Authenticode on 22/03/22.
//

import UIKit

protocol ChooseSendProtocol{
    func removechooseSendOtpObjPop(address: String)
}
class ChooseMethodPopUp: UIViewController {
    @IBOutlet weak var oMainVw: UIView!
    @IBOutlet weak var oPhoneVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var ophoneLbl: UILabel!
    @IBOutlet weak var oEmailLbl: UILabel!
    var chooseSendOtpObj:ChooseSendProtocol?
    var phone:Bool = false
    var Email:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        Email = true
        oEmailVw.layer.backgroundColor = UIColor.black.cgColor
        oPhoneVw.layer.backgroundColor = UIColor.lightGray.cgColor
        ophoneLbl.textColor = UIColor.black
        oEmailLbl.textColor = UIColor.white
        oMainVw.roundCorners([.topLeft , .topRight], radius: 35)
        // Do any additional setup after loading the view.
    }
    @IBAction func oContinueBtnAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: {
        self.chooseSendOtpObj?.removechooseSendOtpObjPop(address: "good")
        })
}
    @IBAction func oPhoneBtnAction(_ sender: Any) {
            phone = true
            Email = false
            oPhoneVw.layer.backgroundColor = UIColor.black.cgColor
            oEmailVw.layer.backgroundColor = UIColor.lightGray.cgColor
        ophoneLbl.textColor = UIColor.white
        oEmailLbl.textColor = UIColor.black
        }
    @IBAction func oEmailBtnAction(_ sender: Any) {
        Email = true
        phone = false
        oEmailVw.layer.backgroundColor = UIColor.black.cgColor
        oPhoneVw.layer.backgroundColor = UIColor.lightGray.cgColor
        ophoneLbl.textColor = UIColor.black
        oEmailLbl.textColor = UIColor.white
}
}
