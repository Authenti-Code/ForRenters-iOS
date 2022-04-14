//
//  ThankYouPopUp.swift
//  ForRenters
//
//  Created by Pankush Mehra on 14/04/22.
//

import UIKit
protocol ThankYouProtocol{
    func removethankYouObjPop(address:String)
}
class ThankYouPopUp: UIViewController {
    @IBOutlet weak var oMainVw: UIView!
    var thankYouObj:ThankYouProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        oMainVw.layer.shadowColor = UIColor.red.cgColor
        oMainVw.layer.shadowOpacity = 0.4
        oMainVw.layer.shadowRadius = 8.0
        oMainVw.layer.shadowOffset = .zero
        oMainVw.layer.masksToBounds = false
    }
    @IBAction func oContinueBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: {
        self.thankYouObj?.removethankYouObjPop(address:"good")
        })
    }
}
