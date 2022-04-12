//
//  RatingVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 12/04/22.
//

import UIKit

class RatingVc: UIViewController {
    @IBOutlet weak var RatingStickerCVw:UICollectionView!
    @IBOutlet weak var RatingQuestionTblVw:UITableView!
    @IBOutlet weak var RatingAddressVerifTblVw:UITableView!
    @IBOutlet weak var RatingQuestionGroupCVw:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        RatingStickerCVw.delegate = self
        RatingStickerCVw.dataSource = self
        RatingQuestionTblVw.delegate = self
        RatingQuestionTblVw.dataSource = self
        RatingAddressVerifTblVw.delegate = self
        RatingAddressVerifTblVw.dataSource = self
        RatingQuestionGroupCVw.delegate = self
        RatingQuestionGroupCVw.dataSource = self
    }
}
//MARK:-->  Collection View Delegate Method
extension RatingVc: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RatingStickerCVw.dequeueReusableCell(withReuseIdentifier: "RatingStickerCollectionCell", for: indexPath) as! RatingStickerCollectionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
           
        }
    }
}
extension RatingVc: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RatingQuestionTblVw.dequeueReusableCell(withIdentifier: "RatingQuestionTblCell") as! RatingQuestionTblCell
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
////MARK:-->  Collection View Delegate Method
//extension RatingVc: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = RatingQuestionGroupCVw.dequeueReusableCell(withReuseIdentifier: "ReviewCollectionCell", for: indexPath) as! ReviewCollectionCell
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.row == 0 {
//
//        }
//    }
//}
//extension RatingVc: UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = ReviewTblVw.dequeueReusableCell(withIdentifier: "ReviewsTblCell") as! ReviewsTblCell
//        // MARK :-- Password View Shadow
//
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//}
//    func tableView(tableView: UITableView,
//        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}
