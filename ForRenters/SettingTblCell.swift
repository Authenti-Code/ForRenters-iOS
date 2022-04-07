//
//  SettingTblCell.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import UIKit

class SettingTblCell: UITableViewCell {

    @IBOutlet weak var oInstaTikView: UIView!
    @IBOutlet weak var oMainVw: UIView!
    @IBOutlet weak var oTiktokVw: UIView!
    @IBOutlet weak var oInstaVw: UIView!
    @IBOutlet weak var oSettingLbl: UILabel!
    @IBOutlet weak var oSettingIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
