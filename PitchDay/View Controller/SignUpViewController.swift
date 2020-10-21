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

protocol SignUpViewControllerDelegate: class {
	func emailValid(_ email1: String, _ email2: String) -> Bool
}

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
	
// MARK: - Delgates
	weak var validDelagate: SignUpViewControllerDelegate?
	
// MARK: - IBOutlets
	@IBOutlet weak var firstNameField: UITextField!
	@IBOutlet weak var lastNameField: UITextField!
	@IBOutlet weak var companyNameField: UITextField!
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var emailConfirmationField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var passwordConfirmationField: UITextField!
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
		
		if userInfoValid() && emailValid(emailField.text!, emailConfirmationField.text!) && passwordValid() {
			createUser()
		} else {
			displayAlertMessage(messageToDisplay: "Please verify that you filled out each field correctly.")
		}
	}
	

// MARK: - FUNCTIONS
	
	func createUser() {
		
		Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { authResult, error in
			if error != nil {
				self.displayAlertMessage(messageToDisplay: "There was an error. Please contact info@novusclub.org for help. Error message: \(String(describing: error))")
				print("The user was not created due to an error")
			} else {
				
				// Storing User Information (firstName, lastName, companyName)
				let db = Firestore.firestore()
				db.collection("users").addDocument(data: ["firstName": self.firstNameField.text!,
														  "lastName": self.lastNameField.text!,
														  "companyName": self.companyNameField.text!])
				{ (error) in
					if error != nil {
						print("User data could not be stored due to the following error. \(String(describing: error))")
						
				// Sending email verification
				Auth.auth().currentUser?.sendEmailVerification { error in
					if error != nil {
						
					}
				}
						
				}}
				print("User data stored.")
				self.displaySignUpSuccessMessage(messageToDisplay: "Thanks for signing up! Please sign in and verify your email, when you get a chance.")
		}}
	}
	
	func displaySignUpSuccessMessage(messageToDisplay: String){
		let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
			self.navigationController?.popViewController(animated: true)
			print("Ok button tapped");
			
		}
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion:nil)
	}
	
	func textFieldEmpty(textField: UITextField) -> Bool {
		guard let text = textField.text,
			!text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
			return true
		}

		return false
	}
		
	func displayAlertMessage(messageToDisplay: String){
		let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
		
		let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
			print("Ok button tapped");
			
		}
		
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion:nil)
	}
	
	func passwordValid() -> Bool {
		
		let passwordStandard = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
		
		if !textFieldEmpty(textField: passwordField) && !textFieldEmpty(textField: passwordConfirmationField) {
			
			let password1 = passwordField.text
			let password2 = passwordConfirmationField.text
			
			if password1 == password2 {
				
				if passwordStandard.evaluate(with: password1) {
					return true
				} else {
					print("Password is not strong enough")
					displayAlertMessage(messageToDisplay: "Please ensure that your password has at least 2 uppercase letters, 3 lowercase letters, 2 digits, and 1 special character.")
					return false
				}
			} else {
				print("Passwords do not match")
				displayAlertMessage(messageToDisplay: "Password fields do not match.")
				return false
			}
		} else {
			print("Password fields are empty.")
			displayAlertMessage(messageToDisplay: "Please fill out the password fields.")
			return false
		}
	}
	
	func userInfoValid() -> Bool {
		var returnValue: Bool
		
		if !textFieldEmpty(textField: firstNameField) && !textFieldEmpty(textField: lastNameField) && !textFieldEmpty(textField: companyNameField){
			returnValue = true
		} else {
			print("firstNameField, lastNameField, and/or companyNameField is missing")
			displayAlertMessage(messageToDisplay: "Please ensure that you have filled out every field.")
			returnValue = false
		}
		
		return returnValue
	}
	
	func saveUser() {
		let user = User(context: PersistenceController.container.viewContext)

		PersistenceController.save(user)
		navigationController?.popViewController(animated: true)
    }

}

