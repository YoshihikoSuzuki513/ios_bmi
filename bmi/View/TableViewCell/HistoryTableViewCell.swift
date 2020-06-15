//
//  HistoryTableViewCell.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
	
	@IBOutlet weak var dayLabel: UILabel!
	@IBOutlet weak var heightLabel: UILabel!
	@IBOutlet weak var weightLabel: UILabel!
	@IBOutlet weak var bmiLabel: UILabel!
	@IBOutlet weak var memoLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
		
	func setData(saveDateList: Array<Any>, histories: Array<Dictionary<String, Any>>, indexPath: IndexPath) {
		if let savedDate = saveDateList[indexPath.row] as? String {
			self.dayLabel.text = convertDay(savedDate: savedDate) + "日"
		}
		if let height = histories[indexPath.row]["height"] as? Double {
			self.heightLabel.text = "身長：" + String(height) + " cm"
		}
		if let weight = histories[indexPath.row]["weight"] as? Double {
			self.weightLabel.text = "体重：" + String(weight) + " kg"
		}
		if let bmi = histories[indexPath.row]["bmi"] as? Double {
			self.bmiLabel.text = "BMI：" + String(bmi)
		}
		if let memo = histories[indexPath.row]["memo"] as? String {
			self.memoLabel.text = memo
		}
	}
	
	private func convertDay(savedDate: String) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
		guard let date = formatter.date(from: savedDate) else { return "" }
		formatter.dateFormat = "dd"
		let day = formatter.string(from: date)
		return day
	}

}
