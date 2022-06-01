//
//  AboutUsVC.swift
//  ForRenters
//
//  Created by Pankush Mehra on 30/05/22.
//

import UIKit

class AboutUsVC: UIViewController {
    @IBOutlet weak var descriptionLbl: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        aboutUsApi{
            self.descriptionLbl.text  = "WE are new company"
        }
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension AboutUsVC {
    //MARK:--> Hit aboutUs Api Handling
    func aboutUsApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.aboutUs)"
        var param = [String : Any]()
        param = ["":""]
       print("param",param)
        WebProxy.shared.postData(Url, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    if let dataDic = JSON["data"] as? NSDictionary{
                        aboutasObj.datadict(data:dataDic)
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

