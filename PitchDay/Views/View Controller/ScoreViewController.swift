//
//  ScoreViewController.swift
//  PitchDay
//
//  Created by Josh on 11/9/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var scoreListTableview: UITableView!
	
	// get data for x startup from firebase
	let data: [(scoreCategory: String, scoreValue: Int, scoreComment: String)] = [(scoreCategory: "Problem", scoreValue: 3, scoreComment: "Good problem - good job."),
																				  (scoreCategory: "Solution", scoreValue: 2, scoreComment: "Awesome solution peeps"),
																				  (scoreCategory: "UVP", scoreValue: 4, scoreComment: "This is so unique"),
																				  (scoreCategory: "Channels", scoreValue: 1, scoreComment: "The channels... wow"),
																				  (scoreCategory: "Segments", scoreValue: 3, scoreComment: "Solid segments identified")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.scoreListTableview.dataSource = self
		self.scoreListTableview.delegate = self
		self.registerTableViewCells()
	}
	
	
	/// Registers tableview with StudentEntryTableViewCell
	private func registerTableViewCells() {
		let scoreTableviewCell = UINib(nibName: "ScoreTableviewCell",
									 bundle: nil)
		self.scoreListTableview.register(scoreTableviewCell,
									   forCellReuseIdentifier: "ScoreTableviewCell")
	}
	
	/// Returns number of rows in startupTableView
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}
	
	/// Fills in cells
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = scoreListTableview.dequeueReusableCell(withIdentifier: "ScoreTableviewCell") as? ScoreTableViewCell {
			
			cell.scoreCategoryLabel.text = data[indexPath.row].scoreCategory
			cell.scoreValueLabel.text = String(data[indexPath.row].scoreValue)
			cell.scoreCategoryQuestionLabel.text = "This startup has identified a significant problem that should be solved."
			
			return cell
		}
		
		return UITableViewCell()
	}
	
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let judgeViewController = storyboard?.instantiateViewController(identifier: "judge") as! JudgeViewController
//		judgeViewController.startupName = data[indexPath.row].startupName
//        navigationController?.pushViewController(judgeViewController, animated: true)
//    }

}
