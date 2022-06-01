//
//  PrivacyPolicyVC.swift
//  ForRenters
//
//  Created by Pankush Mehra on 30/05/22.
//

import UIKit

class PrivacyPolicyVC: UIViewController {
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        privacyPolicyApi{
            self.descriptionLbl.text = "Privacy Policy"
        }
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension PrivacyPolicyVC {
    //MARK:--> Hit privacyPolicy Api Handling
    func privacyPolicyApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.privacyPolicy)"
        var param = [String : Any]()
        param = ["":""]
       print("param",param)
        WebProxy.shared.postData(Url, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    if let dataDic = JSON["data"] as? NSDictionary{
                        privacyObj.datadict(data:dataDic)
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
