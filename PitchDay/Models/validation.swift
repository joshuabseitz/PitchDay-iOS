//
//  validation.swift
//  PitchDay
//
//  Created by Josh on 10/20/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

extension SignUpViewController: SignUpViewControllerValidationDelegate {
	
	//MARK: - User Info Validation
	
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
	
	//MARK: - Password Validation
	
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
	
	// MARK: - Email Validation
	
//	func emailValid(_ email1: String, _ email2: String) -> Bool {
//		
//		var returnValue: Bool
//		
//		if !textFieldEmpty(textField: emailField) && !textFieldEmpty(textField: emailConfirmationField){
//			
//			let email1 = emailField.text
//			let email2 = emailConfirmationField.text
//			
//			if ((email1!.elementsEqual(email2!)) == true) {
//				
//				if isEmailRegexValid(email1!)
//				{
//					print("Email address is valid")
//					returnValue = true
//				} else {
//					print("Email address is not valid")
//					displayAlertMessage(messageToDisplay: "Email address is not valid")
//					returnValue = false
//				}
//				
//			} else {
//				print("Email fields do not match")
//				displayAlertMessage(messageToDisplay: "The email fields do not match.")
//				returnValue = false
//			}
//			
//		} else {
//			print("emailField is empty")
//			displayAlertMessage(messageToDisplay: "Please verify that you have entered an email.")
//			returnValue = false
//		}
//		
//		return returnValue
//	}
	
}
