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
    }
    
// MARK: - IBActions
	
	@IBAction func didTapSignUp(_ sender: Any) {
		
		if self.isTextValid() {
			createUser()
		} else {
			print("Text in form is not valid")
		}
		
		navigationController?.popViewController(animated: true)
	}
	

// MARK: - FUNCTIONS
	
	func isTextValid() -> Bool {
		return true
		// TODO: Check if text is valid
	}
	
	func createUser() {
		
		if userInfoValid() && emailValid() && passwordValid() {
			
			Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { authResult, error in
				if error != nil {
					print("The user was not created due to an error")
				} else {
					let db = Firestore.firestore()
					db.collection("users").addDocument(data: ["firstName": self.firstNameField.text!,
															  "lastName": self.lastNameField.text!,
															  "companyName": self.companyNameField.text!])
					{ (error) in
						if error != nil {
							print("User data could not be stored due to the following error. \(String(describing: error))")
					}}
					
					print("User data stored.")
			}}
			
		} else {
			displayAlertMessage(messageToDisplay: "Please verify that you typed your information correctly.")
		}
		
	}
	
	func passwordValid(_ password: String) -> Bool {
		
		let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
		return passwordTest.evaluate(with: password)
		
		return true
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
	
	func emailValid() -> Bool {
		
		var returnValue: Bool
		
		if !textFieldEmpty(textField: emailField) && !textFieldEmpty(textField: emailConfirmationField){
			
			let email1 = emailField.text
			let email2 = emailConfirmationField.text
			
			if email1 == email2 {
			
				let isEmailAddressValid = isValidEmailAddress(emailAddressString: email1!)
				
				if isEmailAddressValid
				{
					print("Email address is valid")
					returnValue = true
				} else {
					print("Email address is not valid")
					displayAlertMessage(messageToDisplay: "Email address is not valid")
					returnValue = false
				}
				
			} else {
				print("Email fields do not match")
				displayAlertMessage(messageToDisplay: "The email fields do not match.")
				returnValue = false
			}
			
		} else {
			print("emailField is empty")
			displayAlertMessage(messageToDisplay: "Please verify that you have entered an email.")
			returnValue = false
		}
		
		return returnValue
	}
	
	func textFieldEmpty(textField: UITextField) -> Bool {
		guard let text = textField.text,
			!text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
			return true
		}

		return false
	}
	
	func isValidEmailAddress(emailAddressString: String) -> Bool {
		   
		   var returnValue = true
		   let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
		   
		   do {
			   let regex = try NSRegularExpression(pattern: emailRegEx)
			   let nsString = emailAddressString as NSString
			   let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
			   
			   if results.count == 0
			   {
				   returnValue = false
			   }
			   
		   } catch let error as NSError {
			   print("invalid regex: \(error.localizedDescription)")
			   returnValue = false
		   }
		   
		   return  returnValue
	}
	
	func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
    }

}
