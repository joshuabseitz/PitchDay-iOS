//
//  CustomButton.swift
//  PitchDay
//
//  Created by Josh on 10/20/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
	
	override init(frame: CGRect) {
		super.init(frame:frame)
		setupButton()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setupButton() {
		layer.borderColor = UIColor.white.cgColor
		layer.borderWidth = 0.75
		layer.cornerRadius = 5.0
	}
	
}
