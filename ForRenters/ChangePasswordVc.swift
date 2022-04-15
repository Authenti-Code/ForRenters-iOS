//
//  ChangePasswordVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 15/04/22.
//

import UIKit

class ChangePasswordVc: UIViewController, BackToLogProtocol  {
    func removebacktoLogObjPop(addresss: String) {
        let vc = UIStoryboard(name: "Main", bundle:
        nil).instantiateViewController(withIdentifier: "LogInVc") as! LogInVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var oNPasswordVw: UIView!
    @IBOutlet weak var CNPasswordVw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
        // Do any additional setup after loading the view.
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveBtnAction(_ sender: Any) {
        let nav = storyboard?.instantiateViewController(withIdentifier: "BackLogInPopUp") as! BackLogInPopUp
        nav.backtoLogObj = self
        self.navigationController?.present(nav, animated: false, completion: nil)
    }
}
extension ChangePasswordVc{
    func addshadow(){
        // MARK :-- New Password View Shadow
        oNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oNPasswordVw.layer.shadowOpacity = 0.1
        oNPasswordVw.layer.shadowRadius = 3.0
        oNPasswordVw.layer.shadowOffset = .zero
        oNPasswordVw.layer.masksToBounds = false
        // MARK :-- Confirm New Password View Shadow
        CNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        CNPasswordVw.layer.shadowOpacity = 0.1
        CNPasswordVw.layer.shadowRadius = 3.0
        CNPasswordVw.layer.shadowOffset = .zero
        CNPasswordVw.layer.masksToBounds = false
    }
}
