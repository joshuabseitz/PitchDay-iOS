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
	@IBOutlet var scoreCategoryQuestionLabel: UITextView!
	
	@IBOutlet weak var scoreButton0: UIButton!
	@IBOutlet weak var scoreButton1: UIButton!
	@IBOutlet weak var scoreButton2: UIButton!
	@IBOutlet weak var scoreButton3: UIButton!
	
	let pickerData = ["Missing", "Strongly Disagree", "Disagree", "Agree", "Strongly Agree"]
	
	var allScoreButtons: [UIButton] {
		return [scoreButton0, scoreButton1, scoreButton2, scoreButton3]
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
		for button in allScoreButtons {
			button.addScoreStyling()
		}
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
