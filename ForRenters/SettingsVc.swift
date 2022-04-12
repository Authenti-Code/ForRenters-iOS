//
//  SettingsVc.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit

class SettingsVc: UIViewController, LogOutProtocol {
    func removelogoutObjPop(address: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogInVc") as! LogInVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var SettingTblView: UITableView!
    var SettNameAry = ["About us","Privacy Policy/Cookies","Help","Contact us","Terms of use","Reset password","","Logout"]
    var SettIconAry = ["Sprofile","privacy","help","contact-us","terms-of-use","reset-password","","logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingTblView.delegate = self
        SettingTblView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
extension SettingsVc: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingTblView.dequeueReusableCell(withIdentifier: "SettingTblCell") as! SettingTblCell
        cell.oSettingIcon.image = UIImage(named: SettIconAry[indexPath.row])
        cell.oSettingLbl.text = SettNameAry[indexPath.row]
        if indexPath.row == 0 {
            shadow()
            cell.oInstaTikView.isHidden = true
        }
        else if indexPath.row == 1 {
            shadow()
            cell.oInstaTikView.isHidden = true
        }
        else if indexPath.row == 2 {
            shadow()
            cell.oInstaTikView.isHidden = true
        }
        else if indexPath.row == 3 {
            shadow()
            cell.oInstaTikView.isHidden = true
        }
        else if indexPath.row == 4 {
            shadow()
            cell.oInstaTikView.isHidden = true
        }
        else if indexPath.row == 6{
            // MARK :-- Instagram View Shadow
            cell.oInstaVw.layer.shadowColor = UIColor.red.cgColor
            cell.oInstaVw.layer.shadowOpacity = 0.1
            cell.oInstaVw.layer.shadowRadius = 3.0
            cell.oInstaVw.layer.shadowOffset = .zero
            cell.oInstaVw.layer.masksToBounds = false
            // MARK :-- Tiktok View Shadow
            cell.oTiktokVw.layer.shadowColor = UIColor.red.cgColor
            cell.oTiktokVw.layer.shadowOpacity = 0.1
            cell.oTiktokVw.layer.shadowRadius = 3.0
            cell.oTiktokVw.layer.shadowOffset = .zero
            cell.oTiktokVw.layer.masksToBounds = false
        }
        else if indexPath.row == 5 {
            shadow()
            cell.oInstaTikView.isHidden = true
        }
       
        else if indexPath.row == 7 {
            shadow()
            cell.oInstaTikView.isHidden = true
        }
        
        // MARK :-- table Cell Main View Shadow
        func shadow()
        {
            cell.oMainVw.layer.shadowColor = UIColor.red.cgColor
            cell.oMainVw.layer.shadowOpacity = 0.1
            cell.oMainVw.layer.shadowRadius = 3.0
            cell.oMainVw.layer.shadowOffset = .zero
            cell.oMainVw.layer.masksToBounds = false
            cell.oInstaTikView.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 7{
            let nav = storyboard?.instantiateViewController(withIdentifier: "LogoutPopUp") as! LogoutPopUp
            nav.logoutObj = self
            self.navigationController?.present(nav, animated: false, completion: nil)
        }
        if indexPath.row == 5{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordVc") as! ResetPasswordVc
            self.navigationController?.pushViewController(vc, animated: true)
           
        }
}
}
