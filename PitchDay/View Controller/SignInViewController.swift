
//
//  ViewController.swift
//  PitchDay
//
//  Created by Josh on 10/11/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
	
//	MARK: - Properties
	
	// TODO: logo UIImageView
	
	// Login Button
	let loginButtonCornerRadius: CGFloat = 5.0
	let loginButtonBorderColor = UIColor.white
	let loginButtonBackgroundColor = UIColor.white
	
	// Password Field
	let passwordPlaceholder = NSAttributedString(string: "Password",
												 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let passwordFieldButtonCornerRadius: CGFloat = 5.0
	let passwordFieldButtonBorderColor = UIColor.white.cgColor
	let passwordFieldBorderWidth: CGFloat = 0.75
	let passwordFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Email Field
	let emailPlaceholder = NSAttributedString(string: "Email",
											  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let emailFieldButtonCornerRadius: CGFloat = 5.0
	let emailFieldButtonBorderColor = UIColor.white.cgColor
	let emailFieldBorderWidth: CGFloat = 0.75
	let emailFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Sign Up Button
	let signUpButtonText = "Don't already have an account?"
	
	// Footer Label
	let footerLabelText = "novusclub.org"
	
//	MARK: - IBOUTLETS
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var footerLabel: UILabel!
	@IBOutlet weak var signUpButton: UIButton!
	
//	MARK: - View Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
		
		emailField.attributedPlaceholder = emailPlaceholder
		emailField.layer.borderColor = emailFieldButtonBorderColor
		emailField.layer.borderWidth = emailFieldBorderWidth
		emailField.layer.cornerRadius = emailFieldButtonCornerRadius
		emailField.leftView = emailFieldPaddingView
		emailField.leftViewMode = .always
		
		passwordField.attributedPlaceholder = passwordPlaceholder
		passwordField.layer.borderColor = passwordFieldButtonBorderColor
		passwordField.layer.borderWidth = passwordFieldBorderWidth
		passwordField.layer.cornerRadius = passwordFieldButtonCornerRadius
		passwordField.leftView = passwordFieldPaddingView
		passwordField.leftViewMode = .always
		
		loginButton.backgroundColor = loginButtonBackgroundColor
		loginButton.layer.cornerRadius = loginButtonCornerRadius
		
		signUpButton.setTitle(signUpButtonText, for: .normal)
		footerLabel.text = footerLabelText
		
	}
	
// MARK - IBAction
	
	@IBAction func didTapLogin(_ sender: Any) {
		
		guard let email = emailField.text, !email.isEmpty else {
			print("emailField is empty")
            return
        }
		
		guard let password = passwordField.text, !password.isEmpty else {
			print("passwordField is empty")
            return
        }
	}
	
	@IBAction func didTapSignUp(_ sender: Any) {
		performSegue(withIdentifier: "signUp", sender: sender)
	}
	
}
