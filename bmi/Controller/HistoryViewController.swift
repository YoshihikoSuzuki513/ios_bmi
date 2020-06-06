//
//  HistoryViewController.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/21.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
	
	@IBOutlet weak var historyTableView: UITableView!
	
	var saveDateList: Array<Any> = Array<Any>()
	var histories: Array<Dictionary<String, Any>> = Array<Dictionary<String, Any>>()
	
	//MARK: UIViewControllerライフサイクル
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		histories = DataMapper.getHistoryData()
		saveDateList = DataMapper.getSaveDate()
		historyTableView.reloadData()
	}
	
}

extension HistoryViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		saveDateList.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard let date = saveDateList[section] as? String else { return "" }
		return date
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return histories.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let historyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as? HistoryTableViewCell else {
			return HistoryTableViewCell()
		}
		historyTableViewCell.setData(saveDateList: saveDateList, histories: histories, indexPath: indexPath)
		return historyTableViewCell
	}
}

extension HistoryViewController: UITableViewDelegate {
	
}
