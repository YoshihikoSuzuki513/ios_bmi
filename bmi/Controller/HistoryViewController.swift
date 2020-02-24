//
//  HistoryViewController.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/21.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var historyTableView: UITableView!
	
	var histories: Array<Dictionary<String, Any>> = Array<Dictionary<String, Any>>()
	var saveDate: Array<Any> = Array<Any>()
		
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		histories = DataMapper.getHistoryData()
		saveDate = DataMapper.getSaveDate()
		historyTableView.reloadData()
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		saveDate.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard let date = saveDate[section] as? String else {
			return ""
		}
		return date
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return histories.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let historyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as? HistoryTableViewCell else {
			return HistoryTableViewCell()
		}
		// TODO: 日にちだけ表示する
		if let day = saveDate[indexPath.row] as? String {
			historyTableViewCell.dayLabel.text = day
		}
		if let height = histories[indexPath.row]["height"] as? Double {
			historyTableViewCell.heightLabel.text = "身長：" + String(height) + " cm"
		}
		if let weight = histories[indexPath.row]["weight"] as? Double {
			historyTableViewCell.weightLabel.text = "体重：" + String(weight) + " kg"
		}
		if let bmi = histories[indexPath.row]["bmi"] as? Double {
			historyTableViewCell.bmiLabel.text = "BMI：" + String(bmi)
		}
		if let memo = histories[indexPath.row]["memo"] as? String {
			historyTableViewCell.memoLabel.text = memo
		}
		return historyTableViewCell
	}
	

}

