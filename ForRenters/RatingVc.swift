//
//  RatingVc.swift
//  ForRenters
//
//  Created by Pankush Mehra on 12/04/22.
//

import UIKit
import SDWebImage

class RatingVc: UIViewController, ThankYouProtocol {
    func removethankYouObjPop(address: String) {
        if let tabBarController = self.navigationController?.tabBarController  {
               tabBarController.selectedIndex = 1
     navigationController?.popToRootViewController(animated: true)
    }
    }
    @IBOutlet weak var RatingStickerCVw:UICollectionView!
    @IBOutlet weak var RatingQuestionTblVw:UITableView!
    @IBOutlet weak var RatingAddressVerifTblVw:UITableView!
    @IBOutlet weak var RatingQuestionGroupCVw:UICollectionView!
    @IBOutlet weak var oStickerVw: UIView!
    var sticlerIconAry = ["awfull","ok","good","great","awesome"]
    var sticlerNameAry = ["Awful","Ok","Good","Great","Awesome"]
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        RatingStickerCVw.delegate = self
        RatingStickerCVw.dataSource = self
        RatingQuestionTblVw.delegate = self
        RatingQuestionTblVw.dataSource = self
        RatingAddressVerifTblVw.delegate = self
        RatingAddressVerifTblVw.dataSource = self
        RatingQuestionGroupCVw.delegate = self
        RatingQuestionGroupCVw.dataSource = self
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func oSubmitReviewAction(_ sender: Any) {
        let nav = storyboard?.instantiateViewController(withIdentifier: "ThankYouPopUp") as! ThankYouPopUp
        nav.thankYouObj = self
        self.navigationController?.present(nav, animated: false, completion: nil)
    }
}
//MARK:-->  Collection View Delegate Method
extension RatingVc: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var aryCount = Int()
        if collectionView ==  RatingStickerCVw{
            aryCount = sticlerIconAry.count
        } else  if collectionView == RatingQuestionGroupCVw{
            aryCount = groupAry.count
        }
        return aryCount
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellMain = UICollectionViewCell()
        if collectionView == RatingStickerCVw{
            let cell = RatingStickerCVw.dequeueReusableCell(withReuseIdentifier: "RatingStickerCollectionCell", for: indexPath) as! RatingStickerCollectionCell
            cell.oStickerIcon.image = UIImage(named:sticlerIconAry[indexPath.item])
            cell.oStickerLbl.text = sticlerNameAry[indexPath.item]
            // MARK :-- Password View Shadow
            cellMain = cell
        }
        else if collectionView == RatingQuestionGroupCVw{
            let cell = RatingQuestionGroupCVw.dequeueReusableCell(withReuseIdentifier: "RatingQuestionsGroupCollectionCell", for: indexPath) as! RatingQuestionsGroupCollectionCell
            cell.oGroupLbl.text = groupAry[indexPath.item]
            cellMain = cell
        }
        return cellMain
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }
    }
}
extension RatingVc: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var aryCount = Int()
        if tableView == RatingAddressVerifTblVw{
            aryCount = 1
        } else  if tableView == RatingQuestionTblVw{
            aryCount = 3
        } else{
            aryCount = 1
        }
        return aryCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellMain = UITableViewCell()
        if tableView == RatingAddressVerifTblVw{
            let cell = RatingAddressVerifTblVw.dequeueReusableCell(withIdentifier: "RatingAddressVerifTblCell") as! RatingAddressVerifTblCell
            
            cell.oAddressVw.layer.shadowColor = UIColor.red.cgColor
            cell.oAddressVw.layer.shadowOpacity = 0.1
            cell.oAddressVw.layer.shadowRadius = 3.0
            cell.oAddressVw.layer.shadowOffset = .zero
            cell.oAddressVw.layer.masksToBounds = false
            // MARK :-- Password View Shadow
            cellMain = cell
        }
        else if tableView == RatingQuestionTblVw{
            let cell = RatingQuestionTblVw.dequeueReusableCell(withIdentifier: "RatingQuestionTblCell") as! RatingQuestionTblCell
            cellMain = cell
        }
        return cellMain
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    func tableView(tableView: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension RatingVc{
    func addShadow(){
        // MARK :-- First Name View Shadow
        oStickerVw.layer.shadowColor = UIColor.red.cgColor
        oStickerVw.layer.shadowOpacity = 0.1
        oStickerVw.layer.shadowRadius = 3.0
        oStickerVw.layer.shadowOffset = .zero
        oStickerVw.layer.masksToBounds = false
        // MARK :-- Last NameView Shadow
        RatingQuestionTblVw.layer.shadowColor = UIColor.red.cgColor
        RatingQuestionTblVw.layer.shadowOpacity = 0.1
        RatingQuestionTblVw.layer.shadowRadius = 3.0
        RatingQuestionTblVw.layer.shadowOffset = .zero
        RatingQuestionTblVw.layer.masksToBounds = false
       
        
    }
}
