//
//  PersistenceLayer.swift
//  PitchDay
//
//  Created by Josh on 10/12/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import CoreData
import Firebase

struct PersistenceController {
	
	static var container: NSPersistentContainer!
	
	static func save(_ user: User) {
		do {
			try container.viewContext.save()
		} catch {
			print(error)
		}
		
	}
	
	static func getAllUsers() -> [User] {
		let userFetchRequest: NSFetchRequest<User> = User.fetchRequest()
		let userResult = try! container.viewContext.fetch(userFetchRequest)
		print(userResult)
		return userResult
	}
	
	static func delete(_ user: User) {
		container.viewContext.delete(user)
		try! container.viewContext.save()
		
	}
	
}
