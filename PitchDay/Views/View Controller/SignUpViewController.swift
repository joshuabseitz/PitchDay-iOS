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


// MARK: - Protocols

class SignUpViewController: UIViewController {
	
	// MARK: - Properties
	
	// TODO: logo UIImageView
	
	// View Title
	let viewTitle = "Create an Account"
	
	// Sign Up Button
	let signUpButtonCornerRadius: CGFloat = 5.0
	let signUpButtonBorderColor = UIColor.white
	let signUpButtonBackgroundColor = UIColor.white
	let signUpButtonTitle = "Create an account"
	
	// Sign Up Page Standard Field Properties
	let standardFieldCornerRadius: CGFloat = 5.0
	let standardFieldButtonBorderColor = UIColor.white.cgColor
	let standardFieldBorderWidth: CGFloat = 0.75
	let standardFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// First Name Field Properties
	let firstNameFieldPlaceholder = NSAttributedString(string: "First Name",
													   attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let firstNameFieldCornerRadius: CGFloat = 5.0
	let firstNameFieldButtonBorderColor = UIColor.white.cgColor
	let firstNameFieldBorderWidth: CGFloat = 0.75
	let firstNameFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Last Name Field Properties
	let lastNameFieldPlaceholder = NSAttributedString(string: "Last Name",
													  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let lastNameFieldCornerRadius: CGFloat = 5.0
	let lastNameFieldButtonBorderColor = UIColor.white.cgColor
	let lastNameFieldBorderWidth: CGFloat = 0.75
	let lastNameFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// companyName Field Properties
	let companyNameFieldPlaceholder = NSAttributedString(string: "Company Name",
														 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let companyNameFieldCornerRadius: CGFloat = 5.0
	let companyNameFieldButtonBorderColor = UIColor.white.cgColor
	let companyNameFieldBorderWidth: CGFloat = 0.75
	let companyNameFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// emailField Properties
	let emailPlaceholder = NSAttributedString(string: "Email",
											  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let emailFieldCornerRadius: CGFloat = 5.0
	let emailFieldButtonBorderColor = UIColor.white.cgColor
	let emailFieldBorderWidth: CGFloat = 0.75
	let emailFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Email Confirmation Field Properties
	let emailConfirmationFieldPlaceholder = NSAttributedString(string: "Confirm Email Address",
															   attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let emailConfirmationFieldCornerRadius: CGFloat = 5.0
	let emailConfirmationFieldButtonBorderColor = UIColor.white.cgColor
	let emailConfirmationFieldBorderWidth: CGFloat = 0.75
	let emailConfirmationFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// passwordField Properties
	let passwordPlaceholder = NSAttributedString(string: "Password",
												 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let passwordFieldCornerRadius: CGFloat = 5.0
	let passwordFieldButtonBorderColor = UIColor.white.cgColor
	let passwordFieldBorderWidth: CGFloat = 0.75
	let passwordFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// passwordFieldConfirmation Properties
	let passwordConfirmationPlaceholder = NSAttributedString(string: "Confirm Password",
															 attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
	let passwordConfirmationFieldCornerRadius: CGFloat = 5.0
	let passwordConfirmationFieldButtonBorderColor = UIColor.white.cgColor
	let passwordConfirmationFieldBorderWidth: CGFloat = 0.75
	let passwordConfirmationFieldPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
	
	// Footer Label
	let footerLabelText = "novusclub.org"
	
	// MARK: - Custom Styling
	var customTextField = CustomTextField()
	
	// MARK: - IBOutlets
	@IBOutlet weak var firstNameField: CustomTextField!
	@IBOutlet weak var lastNameField: CustomTextField!
	@IBOutlet weak var companyNameField: CustomTextField!
	@IBOutlet weak var emailField: CustomTextField!
	@IBOutlet weak var emailConfirmationField: CustomTextField!
	@IBOutlet weak var passwordField: CustomTextField!
	@IBOutlet weak var passwordConfirmationField: CustomTextField!
	@IBOutlet weak var signUpButton: UIButton!
	@IBOutlet weak var logo: UIImageView!
	@IBOutlet weak var footerLabel: UILabel!
	
	// MARK: - View Lifecycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		firstNameField.attributedPlaceholder = firstNameFieldPlaceholder
		firstNameField.layer.borderColor = standardFieldButtonBorderColor
		firstNameField.layer.borderWidth = standardFieldBorderWidth
		firstNameField.layer.cornerRadius = standardFieldCornerRadius
		firstNameField.leftView = standardFieldPaddingView
		firstNameField.leftViewMode = .always
		
		lastNameField.attributedPlaceholder = lastNameFieldPlaceholder
		lastNameField.layer.borderColor = lastNameFieldButtonBorderColor
		lastNameField.layer.borderWidth = lastNameFieldBorderWidth
		lastNameField.layer.cornerRadius = lastNameFieldCornerRadius
		lastNameField.leftView = lastNameFieldPaddingView
		lastNameField.leftViewMode = .always
		
		companyNameField.attributedPlaceholder = companyNameFieldPlaceholder
		companyNameField.layer.borderColor = companyNameFieldButtonBorderColor
		companyNameField.layer.borderWidth = companyNameFieldBorderWidth
		companyNameField.layer.cornerRadius = companyNameFieldCornerRadius
		companyNameField.leftView = companyNameFieldPaddingView
		companyNameField.leftViewMode = .always
		
		emailField.attributedPlaceholder = emailPlaceholder
		emailField.layer.borderColor = emailFieldButtonBorderColor
		emailField.layer.borderWidth = emailFieldBorderWidth
		emailField.layer.cornerRadius = emailFieldCornerRadius
		emailField.leftView = emailFieldPaddingView
		emailField.leftViewMode = .always
		
		emailConfirmationField.attributedPlaceholder = emailConfirmationFieldPlaceholder
		emailConfirmationField.layer.borderColor = emailConfirmationFieldButtonBorderColor
		emailConfirmationField.layer.borderWidth = emailConfirmationFieldBorderWidth
		emailConfirmationField.layer.cornerRadius = emailConfirmationFieldCornerRadius
		emailConfirmationField.leftView = emailConfirmationFieldPaddingView
		emailConfirmationField.leftViewMode = .always
		
		passwordField.attributedPlaceholder = passwordPlaceholder
		passwordField.layer.borderColor = passwordFieldButtonBorderColor
		passwordField.layer.borderWidth = passwordFieldBorderWidth
		passwordField.layer.cornerRadius = passwordFieldCornerRadius
		passwordField.leftView = passwordFieldPaddingView
		passwordField.leftViewMode = .always
		
		passwordConfirmationField.attributedPlaceholder = passwordConfirmationPlaceholder
		passwordConfirmationField.layer.borderColor = passwordConfirmationFieldButtonBorderColor
		passwordConfirmationField.layer.borderWidth = passwordConfirmationFieldBorderWidth
		passwordConfirmationField.layer.cornerRadius = passwordConfirmationFieldCornerRadius
		passwordConfirmationField.leftView = passwordConfirmationFieldPaddingView
		passwordConfirmationField.leftViewMode = .always
		
		signUpButton.backgroundColor = signUpButtonBackgroundColor
		signUpButton.layer.cornerRadius = signUpButtonCornerRadius
		signUpButton.setTitle(signUpButtonTitle, for: .normal)
		
		footerLabel.text = footerLabelText
		
		self.title = viewTitle
	}
	
	// MARK: - IBActions
	
	@IBAction func didTapSignUp(_ sender: Any) {
		
		if emptyFields() {
			
			displayAlertMessage(messageToDisplay: "Please make sure you have filled out all fields.")
			
		} else {
			
			let newUser: NewUser = 	NewUser(fName: firstNameField.text!,
											   lName: lastNameField.text!,
											   companyName: companyNameField.text!,
											   email: emailField.text!,
											   password: passwordField.text!)
			
			if emailFieldsMatch() && passwordFieldsMatch() {
				
				if !newUser.isFNameValid() {
					displayAlertMessage(messageToDisplay: "First name field is not valid.")
				} else if !newUser.isLNameValid() {
					displayAlertMessage(messageToDisplay: "Last name field is not valid.")
				} else if !newUser.isCompanyNameValid() {
					displayAlertMessage(messageToDisplay: "Company name field is not valid.")
				} else if !newUser.isEmailValid() {
					displayAlertMessage(messageToDisplay: "Please enter a valid email.")
				} else if !newUser.isPasswordValid() {
					displayAlertMessage(messageToDisplay: "Please ensure that your password has at least 2 uppercase letters, 3 lowercase letters, 2 digits, and 1 special character.")
				} else {
					if UserAuth.createUser(newUser) {
						displaySignUpSuccessMessage(messageToDisplay: "Success! Thank for signing up – please sign in now.")
					} else {
						displayAlertMessage(messageToDisplay: "We could not create your account – please try using a different email address or contacting info@novusclub.org if issues persist.")
					}
				}
				
			}
			
		}
		
	}
	
	
	// MARK: - FUNCTIONS
	
	func emailFieldsMatch() -> Bool {
		
		if emailField.text == emailConfirmationField.text {
			print("Email fields match.")
			return true
		} else {
			displayAlertMessage(messageToDisplay: "Please make sure that your email fields match")
			print("Email fields do not match.")
			return false
		}
		
	}
	
	func passwordFieldsMatch() -> Bool {
		
		if passwordField.text == passwordConfirmationField.text {
			print("Password fields match.")
			return true
		} else {
			print("Password fields do not match.")
			displayAlertMessage(messageToDisplay: "Please make sure that your password fields match")
			return false
		}
		
	}
	
	func emptyFields() -> Bool {
		
		let signUpFields: [(name: String, value: CustomTextField)] = 	[(name: "First name field", value: firstNameField),
																		  (name: "Last name field", value: lastNameField),
																		  (name: "Company name field", value: companyNameField),
																		  (name: "Email address field", emailField),
																		  (name: "Email confirmation address field", value: emailConfirmationField),
																		  (name: "Password field", passwordField),
																		  (name: "Password confirmation", value: passwordConfirmationField)]
		
		for (name, value) in signUpFields {
			if CustomTextField.textFieldEmpty(textField: value) {
				print("\(name) is empty.")
				return true
			}
		}
		return false
	}
	
	func displaySignUpSuccessMessage(messageToDisplay: String){
		let alertController = UIAlertController(title: "Done", message: messageToDisplay, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
			self.navigationController?.popViewController(animated: true)
			print("Ok button tapped");
			
		}
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion:nil)
	}
	
	func displayAlertMessage(messageToDisplay: String){
		let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
			print("Ok button tapped");
			
		}
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion:nil)
	}
	
}

