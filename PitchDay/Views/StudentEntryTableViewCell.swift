//
//  StudentEntryTableViewCell.swift
//  PitchDay
//
//  Created by Josh on 11/2/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class StudentEntryTableViewCell: UITableViewCell {

	@IBOutlet weak var startupNameLabel: UILabel!
	@IBOutlet weak var viewMoreButton: UIButton!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
