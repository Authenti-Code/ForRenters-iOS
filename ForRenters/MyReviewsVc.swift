//
//  MyReviewsVc.swift
//  ForRenters
//
//  Created by Authenticode on 28/03/22.
//

import UIKit

class MyReviewsVc: UIViewController {
    @IBOutlet weak var MyReviewTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyReviewTblView.delegate = self
        MyReviewTblView.dataSource = self
       
        // Do any additional setup after loading the view.
    }
    

}
extension MyReviewsVc: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyReviewTblView.dequeueReusableCell(withIdentifier: "MyReviewTblCell") as! MyReviewTblCell
        // MARK :-- table Cell Main View Shadow
        cell.oMainVw.layer.shadowColor = UIColor.red.cgColor
        cell.oMainVw.layer.shadowOpacity = 0.1
        cell.oMainVw.layer.shadowRadius = 3.0
        cell.oMainVw.layer.shadowOffset = .zero
        cell.oMainVw.layer.masksToBounds = false
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReviewsVc") as! ReviewsVc
        self.navigationController?.pushViewController(vc, animated: true)
}
}
