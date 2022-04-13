//
//  ReviewsVc.swift
//  ForRenters
//
//  Created by Authenticode on 30/03/22.
//

import UIKit

class ReviewsVc: UIViewController {
    @IBOutlet weak var ReviewCollectionVw:UICollectionView!
    @IBOutlet weak var ReviewTblVw:UITableView!
    @IBOutlet weak var oRatingVw:UIView!
    @IBOutlet weak var oUserVw:UIView!
    @IBOutlet weak var oStickerVw:UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addshadow()
        ReviewCollectionVw.delegate = self
        ReviewCollectionVw.dataSource = self
        ReviewTblVw.delegate = self
        ReviewTblVw.dataSource = self
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func oAddReviewAction(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RatingVc") as! RatingVc
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK:-->  Collection View Delegate Method
extension ReviewsVc: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ReviewCollectionVw.dequeueReusableCell(withReuseIdentifier: "ReviewCollectionCell", for: indexPath) as! ReviewCollectionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           
        }
    }
}
extension ReviewsVc: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ReviewTblVw.dequeueReusableCell(withIdentifier: "ReviewsTblCell") as! ReviewsTblCell
        // MARK :-- Password View Shadow
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
}
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension ReviewsVc{
    func addshadow(){
        

        // MARK :-- Password View Shadow
        ReviewTblVw.layer.shadowColor = UIColor.red.cgColor
        ReviewTblVw.layer.shadowOpacity = 0.1
        ReviewTblVw.layer.shadowRadius = 3.0
        ReviewTblVw.layer.shadowOffset = .zero
        ReviewTblVw.layer.masksToBounds = false
        // MARK :-- Apple Button Shadow
        oRatingVw.layer.shadowColor = UIColor.red.cgColor
        oRatingVw.layer.shadowOpacity = 0.1
        oRatingVw.layer.shadowRadius = 3.0
        oRatingVw.layer.shadowOffset = .zero
        oRatingVw.layer.masksToBounds = false
        // MARK :-- Google Button Shadow
        oUserVw.layer.shadowColor = UIColor.red.cgColor
        oUserVw.layer.shadowOpacity = 0.1
        oUserVw.layer.shadowRadius = 3.0
        oUserVw.layer.shadowOffset = .zero
        oUserVw.layer.masksToBounds = false
        // MARK :-- LogIn Button Shadow
        oStickerVw.layer.shadowColor = UIColor.red.cgColor
        oStickerVw.layer.shadowOpacity = 3
        oStickerVw.layer.shadowRadius = 0.4
        oStickerVw.layer.shadowOffset = .zero
        oStickerVw.layer.masksToBounds = false

    }
}
