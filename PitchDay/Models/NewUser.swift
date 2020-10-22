//
//  newUser.swift
//  PitchDay
//
//  Created by Josh on 10/21/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

struct NewUser {
	
	var fName: String
	var lName: String
	var companyName: String
	var email: String
	var password: String
	
	init(fName: String, lName: String, companyName: String, email: String, password: String) {
		
		self.fName			= fName
		self.lName			= lName
		self.companyName	= companyName
		self.email			= email
		self.password 		= password
		
	}
	
	init(email: String) {
		self.fName			= ""
		self.lName			= ""
		self.companyName	= ""
		self.email			= email
		self.password 		= ""
	}
	
	func isFNameValid() -> Bool {
		
		// Length be 100 characters max and 1 characters minimum, you can always modify.
		let fNameRegex 		= "^\\w{1,100}$"
		let trimmedString 	= fName.trimmingCharacters(in: .whitespaces)
		let validateName 	= NSPredicate(format: "SELF MATCHES %@", fNameRegex)
		
		return validateName.evaluate(with: trimmedString)
		
	}
	
	func isLNameValid() -> Bool {
		
		// Length be 100 characters max and 1 characters minimum, you can always modify.
		let lNameRegex 		= "^\\w{1,100}$"
		let trimmedString 	= lName.trimmingCharacters(in: .whitespaces)
		let validateName 	= NSPredicate(format: "SELF MATCHES %@", lNameRegex)
		
		return validateName.evaluate(with: trimmedString)
		
	}
	
	func isCompanyNameValid() -> Bool {
		
		// Length be 100 characters max and 1 characters minimum, you can always modify.
		let companyNameRegex 	= "^\\w{1,100}$"
		let trimmedString 		= lName.trimmingCharacters(in: .whitespaces)
		let validateName 		= NSPredicate(format: "SELF MATCHES %@", companyNameRegex)
		
		return validateName.evaluate(with: trimmedString)
		
	}
	
	func isEmailValid() -> Bool {
		
		// TODO: Make return statements better
		
		var returnValue: Bool = true
		
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
	
	func isPasswordValid() -> Bool {
		
		let passwordStandard = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")

		if passwordStandard.evaluate(with: password) {
			print("Password strong enough")
			return true
		} else {
			print("Password is not strong enough")
			return false
		}
		
	}
	
	
}
