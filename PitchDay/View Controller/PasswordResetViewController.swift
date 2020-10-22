//
//  PasswordResetViewController.swift
//  PitchDay
//
//  Created by Josh on 10/14/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit
import Firebase


protocol PasswordResetViewControllerDelegate: class {
	func resetPassword(_ email: String) -> Bool
}

class PasswordResetViewController: UIViewController {
	
	//MARK: - IBOutlets
	@IBOutlet weak var emailField: CustomTextField!
	@IBOutlet weak var resetButton: UIButton!
	@IBOutlet weak var footerLabel: UILabel!
	
	//MARK: - Properties
	
	// View Title
	let viewTitle = "Password Recovery"
	
	// Email Field Properties
	let emailFieldPlaceholder = NSAttributedString(string: "Email Address",
												   attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let emailFieldCornerRadius: CGFloat = 5.0
	let emailFieldButtonBorderColor = UIColor.white.cgColor
	let emailFieldBorderWidth: CGFloat = 0.75
	let emailFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Reset Button Properties
	let resetButtonCornerRadius: CGFloat = 5.0
	let resetButtonBorderColor = UIColor.white
	let resetButtonTitle = "Send a reset link"
	
	// Footer Label Properties
	let footerLabelText = "novusclub.org"
	
	//MARK: - View Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Email Field Setup
		emailField.attributedPlaceholder = emailFieldPlaceholder
		emailField.layer.borderColor = emailFieldButtonBorderColor
		emailField.layer.borderWidth = emailFieldBorderWidth
		emailField.layer.cornerRadius = emailFieldCornerRadius
		emailField.leftView = emailFieldPaddingView
		emailField.leftViewMode = .always
		
		// Reset Button Setup
		resetButton.backgroundColor = resetButtonBorderColor
		resetButton.layer.cornerRadius = resetButtonCornerRadius
		resetButton.setTitle(resetButtonTitle, for: .normal)
		
		// Footer Label Setup
		footerLabel.text = footerLabelText
		
		// Title (Nav Bar) Setup
		self.title = viewTitle
		
	}
	
	//MARK: - IBActions
	@IBAction func didTapSendResetLink(_ sender: UIButton) {
		
		if !textFieldEmpty(textField: emailField){
			
			let resetUser: NewUser = NewUser(email: emailField.text!)
			
			if resetUser.isEmailValid(){
				
				UserAuth.resetPassword(resetUser)
				displayAlertMessage(messageToDisplay: "If there is an account with this email address, a password recovery link has been sent.")
					
			} else {
				displayAlertMessage(messageToDisplay: "Please enter a valid email address.")
			}
			
		} else {
			print("No text in emailField")
		}
		
	}
	
	func textFieldEmpty(textField: CustomTextField) -> Bool {
		guard let text = textField.text,
			!text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
				return true
		}
		
		return false
	}
	
	func displayAlertMessage(messageToDisplay: String) {
		
		let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
			print("Ok button tapped");
			
		}
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion:nil)
	}
	
}
