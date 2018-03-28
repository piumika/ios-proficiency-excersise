//
//  FactTableViewCell.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 28/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import UIKit

class FactTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var factImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
