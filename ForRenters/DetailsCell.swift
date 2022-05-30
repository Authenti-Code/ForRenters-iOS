//
//  DetailsCell.swift
//  ForRenters
//
//  Created by Pankush Mehra on 13/04/22.
//

import UIKit

class DetailsCell: UICollectionViewCell {
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var houseImages: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        detailView.layer.masksToBounds = true
      layer.masksToBounds = false
// MARK:--> a shadow
        layer.shadowRadius = 4
    layer.shadowOpacity = 0.25
    layer.shadowColor = UIColor.red.cgColor
    layer.shadowOffset = .zero
}
}
