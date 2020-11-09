//
//  ScoreTableViewCell.swift
//  PitchDay
//
//  Created by Josh on 11/9/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

	@IBOutlet weak var scoreCategoryLabel: UILabel!
	@IBOutlet weak var scoreValueLabel: UILabel!
	@IBOutlet var scoreCategoryQuestionLabel: UITextView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
