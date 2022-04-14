//
//  OverallRieviewVC.swift
//  ForRenters
//
//  Created by Pankush Mehra on 13/04/22.
//

import UIKit

class OverallRieviewVC: UIViewController {

    @IBOutlet weak var ownerNameView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var listingTableview: UITableView!
    @IBOutlet weak var relatedPropetyCollectionView: UICollectionView!
    @IBOutlet weak var labelCollectionView: UICollectionView!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    var sectionName = ["Landloard", "Neighbour", "Agreement","Energy Efficience"]
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()

        let myIndexPath = IndexPath(row: 1, section: 0)
        let cell = detailCollectionView.cellForItem(at: myIndexPath) as? DetailsCell
        cell?.detailView.layer.shadowOpacity = 10
        }
    @IBAction func didTapReview(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RatingVc") as! RatingVc
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapLeftSwift(_ sender: UIButton) {
//        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
//               let currentItem: NSIndexPath = visibleItems.object(at: 0) as! NSIndexPath
//               let nextItem: NSIndexPath = NSIndexPath(row: currentItem + 1, section: 0)
        let myIndexPath = IndexPath(row: 1, section: 0)
        self.detailCollectionView.scrollToItem(at: myIndexPath, at: .left, animated: true)
    }
    
    @IBAction func didTapRightSwift(_ sender: UIButton) {
        let myIndexPath = IndexPath(row: 1, section: 0)
        self.detailCollectionView.scrollToItem(at: myIndexPath, at: .right, animated: true)
    }
}
extension OverallRieviewVC: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return sectionName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == detailCollectionView {
            let cell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as? DetailsCell
            return cell  ?? UICollectionViewCell()
        } else if collectionView == labelCollectionView {
            let cell = labelCollectionView.dequeueReusableCell(withReuseIdentifier: "DiscriptionCell", for: indexPath) as! DiscriptionCell
           
            cell.lblSectionHeader.text = sectionName[indexPath.row]
            return cell  ?? UICollectionViewCell()
        } else {
            let cell = relatedPropetyCollectionView.dequeueReusableCell(withReuseIdentifier: "RelatedPropertyCell", for: indexPath) as! RelatedPropertyCell
            return cell
        }
    }
}
extension OverallRieviewVC: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = listingTableview.dequeueReusableCell(withIdentifier: "ListingCell", for: indexPath) as! ListingCell
        return cell
    }
}
extension OverallRieviewVC{
    func addShadow(){
        // MARK :-- ratingView View Shadow
        ratingView.layer.shadowColor = UIColor.red.cgColor
        ratingView.layer.shadowOpacity = 0.4
        ratingView.layer.shadowRadius = 5.0
        ratingView.layer.shadowOffset = .zero
        ratingView.layer.masksToBounds = false
        // MARK :-- ownerNameView Shadow
        ownerNameView.layer.shadowColor = UIColor.red.cgColor
        ownerNameView.layer.shadowOpacity = 0.4
        ownerNameView.layer.shadowRadius = 5.0
        ownerNameView.layer.shadowOffset = .zero
        ownerNameView.layer.masksToBounds = false
       
        
    }
}

