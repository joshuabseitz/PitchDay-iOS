//
//  authentication.swift
//  PitchDay
//
//  Created by Josh on 10/20/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseCore

extension SignUpViewController: SignUpViewControllerAuthenticationDelegate {
	
	//MARK: - Create User
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
}

extension PasswordResetViewController: PasswordResetViewControllerDelegate {
	
	//MARK: - Password Reset
	func resetPassword(_ email: String) -> Bool {
		
		var returnValue: Bool = false
		
		Auth.auth().sendPasswordReset(withEmail: email) { error in
			
			if error != nil {
				self.displayAlertMessage(messageToDisplay: "There was an error: \(String(describing: error))")
				print("Password reset link was not sent \(String(describing: error))")
				returnValue = false
			} else {
				self.displayAlertMessage(messageToDisplay: "A password reset link has been sent to your email address.")
				print("Reset link was sent")
				returnValue = true
			}
			
		}
		
		return returnValue
		
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
