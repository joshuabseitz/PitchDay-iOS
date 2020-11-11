//
//  Button+CustomStyling.swift
//  PitchDay
//
//  Created by Josh on 11/11/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
	
	func addScoreStyling() {
		backgroundColor = .clear
		layer.cornerRadius = 2
		layer.borderWidth = 0.5
		layer.borderColor = UIColor.lightGray.cgColor
	}
	
}
