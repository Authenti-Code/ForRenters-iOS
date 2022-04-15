//
//  BackLogInPopUp.swift
//  ForRenters
//
//  Created by Pankush Mehra on 15/04/22.
//

import UIKit
protocol BackToLogProtocol {
    func removebacktoLogObjPop(addresss:String)
}
class BackLogInPopUp: UIViewController {
    var backtoLogObj: BackToLogProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backToLoginAction(_ sender: Any) {
        self.dismiss(animated: true, completion: {
        self.backtoLogObj?.removebacktoLogObjPop(addresss:"good")
        })
    }
}
