//
//  SuccessPopUp.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit
protocol SuccessProtocol{
 func removesuccessObj(address: String)
}
class SuccessPopUp: UIViewController {
    var successObj: SuccessProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func oContinueBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: {
        self.successObj?.removesuccessObj(address: "good")
        })
}
}
