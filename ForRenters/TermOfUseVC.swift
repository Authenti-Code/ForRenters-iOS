//
//  TermOfUseVC.swift
//  ForRenters
//
//  Created by Pankush Mehra on 30/05/22.
//

import UIKit

class TermOfUseVC: UIViewController {
    @IBOutlet weak var descriptionLbl: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         = termConditionObj.terms_consitions
    }
    override func viewWillAppear(_ animated: Bool) {
        termConditionApi{
            self.descriptionLbl.text = "this is all the lorem ipsum text i can display here"
        }
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension TermOfUseVC {
    //MARK:--> Hit termCondition Api Handling
    func termConditionApi(completion:@escaping() -> Void) {
        let Url = "\(Apis.ServerUrl)\(Apis.termCondition)"
        var param = [String : Any]()
        param = ["":""]
       print("param",param)
        WebProxy.shared.postData(Url, params:param, showIndicator: true, methodType: .post) { (JSON, isSuccess, message) in
            if isSuccess {
                let status = JSON["success"] as? String
                if status == "true"{
                    if let dataDic = JSON["data"] as? NSDictionary{

                        print(dataDic)
                        termConditionObj.datadict(data:dataDic)
                        print("termConditionObj",termConditionObj.terms_consitions)
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
