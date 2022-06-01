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
