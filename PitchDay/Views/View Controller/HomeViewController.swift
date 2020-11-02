//
//  HomeViewController.swift
//  PitchDay
//
//  Created by Josh on 10/23/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var startupTableview: UITableView!
	
	let data: [(startupName: String, startupMembers: [String])] = [(startupName: "Johnson and Johnson", startupMembers: ["James Jackson", "Max Friedman"]),
																   (startupName: "Superman", startupMembers: ["Lex Luthor", "Clark Kent"]),
																   (startupName: "Tigerbelly", startupMembers: ["Bobby Lee", "Khalyla Kuhn"]),
																   (startupName: "Backstage", startupMembers: ["Gilbert Galon", "George Kimmel"]),
																   (startupName: "Tonight Show", startupMembers: ["Jimmy Fallon", "The Roots"]),
																   (startupName: "Novus Club", startupMembers: ["Joshua Seitz", "Isaiah Easo"]),
																   (startupName: "McDonald's", startupMembers: ["Ray Kroc", "McDonald's Brothers"]),
																   (startupName: "Apple", startupMembers: ["Steve Jobs", "Steve Wozniak"])]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.setNavigationBarHidden(true, animated: true)
		self.startupTableview.dataSource = self
		self.startupTableview.delegate = self
		
		self.registerTableViewCells()
	}
	
	
	/// Registers tableview with StudentEntryTableViewCell
	private func registerTableViewCells() {
		let studentEntryCell = UINib(nibName: "StudentEntryTableViewCell",
									 bundle: nil)
		self.startupTableview.register(studentEntryCell,
									   forCellReuseIdentifier: "StudentEntryTableViewCell")
	}
	
	/// Returns number of rows in startupTableView
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}
	
	/// Fills in cells
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = startupTableview.dequeueReusableCell(withIdentifier: "StudentEntryTableViewCell") as? StudentEntryTableViewCell {
			cell.startupNameLabel.text = data[indexPath.row].startupName
			return cell
		}
		
		return UITableViewCell()
	}
	
}
