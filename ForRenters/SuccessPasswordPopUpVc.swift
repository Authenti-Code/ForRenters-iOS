//
//  SuccessPasswordPopUpVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 30/05/22.
//

import UIKit
protocol SuccessPasswordPop{
    func removesuccessPasswordObjPop(address: String)
}
class SuccessPasswordPopUpVc: UIViewController {
    var successPasswordObj: SuccessPasswordPop?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ContinueBtnAction(_ sender: Any) {
        self.dismiss(animated: false, completion:
                        {
            self.successPasswordObj?.removesuccessPasswordObjPop(address:"good")
        })
    }
}
