//
//  LogoutPopUp.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import UIKit
protocol LogOutProtocol{
    func removelogoutObjPop(address:String)
}
class LogoutPopUp: UIViewController {
    @IBOutlet weak var oNoBtn: UIButton!
    @IBOutlet weak var oYesBtn: UIButton!
    var logoutObj: LogOutProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
        // Do any additional setup after loading the view.
    }
    @IBAction func oNoBtnAction(_ sender: Any) {
        self.dismiss(animated: false, completion:nil)
    }
    @IBAction func oYesBtnAction(_ sender: Any) {
        self.dismiss(animated: false, completion: {
        self.logoutObj?.removelogoutObjPop(address: "good")
        })
    }
}
extension LogoutPopUp{
    func addshadow(){
        // MARK :-- Confirm Password View Shadow
        oNoBtn.layer.shadowColor = UIColor.gray.cgColor
        oNoBtn.layer.shadowOpacity = 0.3
        oNoBtn.layer.shadowRadius = 4.0
        oNoBtn.layer.shadowOffset = .zero
        oNoBtn.layer.masksToBounds = false
        // MARK :-- Confirm Password View Shadow
        oYesBtn.layer.shadowColor = UIColor.gray.cgColor
        oYesBtn.layer.shadowOpacity = 0.3
        oYesBtn.layer.shadowRadius = 4.0
        oYesBtn.layer.shadowOffset = .zero
        oYesBtn.layer.masksToBounds = false
    }

}
