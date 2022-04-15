//
//  ReviewCollectionCell.swift
//  ForRenters
//
//  Created by Authenticode on 30/03/22.
//

import UIKit

class ReviewCollectionCell: UICollectionViewCell {
    @IBOutlet weak var oGroupLbl:UILabel!
    @IBOutlet weak var oCollectionCellVw:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        oCollectionCellVw.layer.masksToBounds = true
    layer.masksToBounds = false
// MARK:--> a shadow
        layer.shadowRadius = 0.1
        layer.shadowOpacity = 2.0
    layer.shadowColor = UIColor.lightGray.cgColor
    layer.shadowOffset = CGSize(width: 0.5, height: 1.5)
}
}
