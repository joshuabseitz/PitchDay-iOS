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
