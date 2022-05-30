//
//  SurePasswordPopUpVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 30/05/22.
//

import UIKit
protocol SurePasswordPop{
    func removesurepassordObjPop(address:String)
}
class SurePasswordPopUpVc: UIViewController {
    @IBOutlet weak var oNoBtn: UIButton!
    @IBOutlet weak var oYesBtn: UIButton!
    var surepassordObj: SurePasswordPop?
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
        self.surepassordObj?.removesurepassordObjPop(address: "good")
        })
        }
    }
