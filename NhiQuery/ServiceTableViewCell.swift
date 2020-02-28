//
//  ServiceTableViewCell.swift
//  NhiQuery
//
//  Created by KaeJer Cho on 2020/2/26.
//  Copyright © 2020 KaeJer Cho. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var chinese: UILabel!
    @IBOutlet weak var english: UILabel!
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var period: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var other: UILabel!
    
    static let cellNibName = "ServiceTableViewCell"
    static let cellIdentifier = "ServiceTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
