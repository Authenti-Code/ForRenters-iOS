//
//  RatingQuestionsCollectionCell.swift
//  ForRenters
//
//  Created by Pankush Mehra on 12/04/22.
//

import UIKit

class RatingQuestionsGroupCollectionCell: UICollectionViewCell {
    @IBOutlet weak var oMainVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        oMainVw.layer.masksToBounds = true
    layer.masksToBounds = false
 // MARK:--> a shadow
        layer.shadowRadius = 0.1
        layer.shadowOpacity = 2.0
    layer.shadowColor = UIColor.lightGray.cgColor
    layer.shadowOffset = CGSize(width: 0.5, height: 1.5)
}
}
