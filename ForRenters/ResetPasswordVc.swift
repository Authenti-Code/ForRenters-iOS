//
//  ResetPasswordVc.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import UIKit

class ResetPasswordVc: UIViewController {
    @IBOutlet weak var oOPasswordVw: UIView!
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
}
extension ResetPasswordVc{
    func addshadow(){
        // MARK :-- Email View Shadow
        oOPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oOPasswordVw.layer.shadowOpacity = 0.1
        oOPasswordVw.layer.shadowRadius = 3.0
        oOPasswordVw.layer.shadowOffset = .zero
        oOPasswordVw.layer.masksToBounds = false
        // MARK :-- Email View Shadow
        oNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oNPasswordVw.layer.shadowOpacity = 0.1
        oNPasswordVw.layer.shadowRadius = 3.0
        oNPasswordVw.layer.shadowOffset = .zero
        oNPasswordVw.layer.masksToBounds = false
        // MARK :-- Email View Shadow
        CNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        CNPasswordVw.layer.shadowOpacity = 0.1
        CNPasswordVw.layer.shadowRadius = 3.0
        CNPasswordVw.layer.shadowOffset = .zero
        CNPasswordVw.layer.masksToBounds = false
    }
}
