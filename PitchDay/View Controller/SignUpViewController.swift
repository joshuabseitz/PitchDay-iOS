//
//  signUpViewController.swift
//  PitchDay
//
//  Created by Josh on 10/12/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

// MARK: - Properties
	
	// TODO: logo UIImageView
	
	// Sign Up Button
	let signUpButtonCornerRadius: CGFloat = 5.0
	let signUpButtonBorderColor = UIColor.white
	let signUpButtonBackgroundColor = UIColor.white
	let signUpButtonTitle = "Create an account"
	
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
	
	// Footer Label
	let footerLabelText = "novusclub.org"
	
// MARK: - IBOutlets
	
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var footerLabel: UILabel!
	
// MARK: - View Lifecycles
	
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
		
		signUpButton.backgroundColor = signUpButtonBackgroundColor
		signUpButton.layer.cornerRadius = signUpButtonCornerRadius
		signUpButton.setTitle(signUpButtonTitle, for: .normal)
		
		footerLabel.text = footerLabelText
    }
    
// MARK: - IBActions
	
	@IBAction func didTapSignUp(_ sender: Any) {
		self.authenticate()
		navigationController?.popViewController(animated: true)
	}
	

// MARK: - FUNCTIONS
	
	func authenticate() {
		Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { authResult, error in
			if error != nil {
				print(error!)
			} else {
				self.saveUser()
				print("Successful")
			}
		}
	}
	
	
	func saveUser() {
		
        guard let email = emailField.text, !email.isEmpty else {
			print("emailField is empty")
            return
        }
		
		guard let password = passwordField.text, !password.isEmpty else {
			print("passwordField is empty")
            return
        }
		
		let user = User(context: PersistenceController.container.viewContext)
		user.email = email
		
		PersistenceController.save(user)
        navigationController?.popViewController(animated: true)
    }

}
