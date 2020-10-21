//
//  validation.swift
//  PitchDay
//
//  Created by Josh on 10/20/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

extension SignUpViewController: SignUpViewControllerDelegate {
	
	func emailValid(_ email1: String, _ email2: String) -> Bool {
		
		var returnValue: Bool
		
		if !textFieldEmpty(textField: emailField) && !textFieldEmpty(textField: emailConfirmationField){
			
			let email1 = emailField.text
			let email2 = emailConfirmationField.text
			
			if ((email1!.elementsEqual(email2!)) == true) {
				
				if isEmailRegexValid(email1!)
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
	
	func isEmailRegexValid(_ email: String) -> Bool {
		var returnValue = true
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		
		do {
			let regex = try NSRegularExpression(pattern: emailRegEx)
			let nsString = email as NSString
			let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
			
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
	
}
