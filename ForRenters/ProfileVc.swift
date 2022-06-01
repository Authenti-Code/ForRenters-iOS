//
//  ProfileVc.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit
import SDWebImage
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
    @IBOutlet weak var oFirstNameTF: UITextField!
    @IBOutlet weak var oLastNameTF: UITextField!
    @IBOutlet weak var oPhoneTF: UITextField!
    @IBOutlet weak var oEmailTF: UITextField!
    var imgUrl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        Addshadow()
    }
    override func viewWillAppear(_ animated: Bool) {
        GetProfileApi{
            self.loaddata()
        }
    }
    func loaddata(){
        oEmailLbl.text = userdataObj.email
        oUserName.text = userdataObj.first_name
        oFirstNameTF.text = userdataObj.first_name
        oLastNameTF.text = userdataObj.last_name
        oPhoneTF.text = userdataObj.phone_number
        oEmailTF.text = userdataObj.email
       imgUrl = ProfileImg ?? ""
        let removeSpace = imgUrl.replacingOccurrences(of: "", with: "%20")
       oProfileImg.sd_imageIndicator = SDWebImageActivityIndicator.white
      oProfileImg.sd_setImage(with: URL.init(string: removeSpace), placeholderImage: UIImage(named: ""), options: .highPriority, context: [:])
    }
    @IBAction func oEditBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditProfileVc") as! EditProfileVc
        vc.firstName = userdataObj.first_name
        vc.lastName = userdataObj.last_name
        vc.email = userdataObj.email
        vc.phone = userdataObj.phone_number
        vc.profileimg = ProfileImg ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ProfileVc {
    //MARK:--> Hit  Get Profile Details Api
    func GetProfileApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.ProfileDetail)"
        var param = [String : Any]()
        param = ["":""]
        WebProxy.shared.postData(Url, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    if let dataDic = JSON["data"] as? NSDictionary{
//                        Signup_step = dataDic["signup_step"] as? String  ?? ""
                        ProfileImg = dataDic["profile_image"] as? String ?? ""
                        userdataObj.datadict(data:dataDic)
                    }
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
