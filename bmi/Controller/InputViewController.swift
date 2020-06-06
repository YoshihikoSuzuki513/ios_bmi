//
//  InputViewController.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/21.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var heightTextField: UITextField!
	@IBOutlet weak var weightTextField: UITextField!
	@IBOutlet weak var memoTextField: UITextField!
	@IBOutlet weak var bmiResultLabel: UILabel!
	
	var height: Height = Height.init(with: 0)
	var weight: Weight = Weight.init(with: 0)
		
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField.tag == 0 {
			weightTextField.becomeFirstResponder()
			return true
		}
		if textField.tag == 1 {
			bmi((Any).self)
			return true
		}
		return true
	}
		
	@IBAction func bmi(_ sender: Any) {
		validationInputData()
		let bmi = Bmi.init(height: height, weight: weight)
		bmiResultLabel.text = String(bmi.value)
	}
	
	@IBAction func deleteData(_ sender: Any) {
		DataMapper.delete()
	}
	
	@IBAction func saveData(_ sender: Any) {
		validationInputData()
		let bmi = Bmi.init(height: height, weight: weight)
		let memo = Memo.init(with: memoTextField.text)
		let user = User.init(height: height, weight: weight, bmi: bmi, memo: memo)
		DataMapper.save(user: user)
	}
	
	private func validationInputData() {
		do {
			height = try Height.init(with: heightTextField.text)
			weight = try Weight.init(with: weightTextField.text)
		} catch {
			AlertViewController.showAlertController(viewController: self)
			return
		}
	}
	
}

