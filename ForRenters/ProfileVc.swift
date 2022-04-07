//
//  ProfileVc.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit

class ProfileVc: UIViewController {
    @IBOutlet weak var oFNameVw: UIView!
    @IBOutlet weak var oLNameVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var PNumberVw: UIView!
    @IBOutlet weak var EditBtn: UIButton!
    @IBOutlet weak var oProfileImg: UIImageView!
    @IBOutlet weak var oUserName: UILabel!
    @IBOutlet weak var oEmailLbl: UILabel!
    @IBOutlet weak var oProfileVw: UIView!
    @IBOutlet weak var oPDetailVw: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Addshadow()
        // Do any additional setup after loading the view.
    }
    @IBAction func oEditBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileVc") as! EditProfileVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ProfileVc{
    func Addshadow(){
        oProfileVw.layer.shadowColor = UIColor.red.cgColor
        oProfileVw.layer.shadowOpacity = 0.1
        oProfileVw.layer.shadowRadius = 3.0
        oProfileVw.layer.shadowOffset = .zero
        oProfileVw.layer.masksToBounds = false
        
        oPDetailVw.layer.shadowColor = UIColor.red.cgColor
        oPDetailVw.layer.shadowOpacity = 0.1
        oPDetailVw.layer.shadowRadius = 3.0
        oPDetailVw.layer.shadowOffset = .zero
        oPDetailVw.layer.masksToBounds = false
    
    }
}

