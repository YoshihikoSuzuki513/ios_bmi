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
	
	var height: Height = Height.init(value: 0)
	var weight: Weight = Weight.init(value: 0)
		
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
		guard let inputHeightValue = heightTextField.text else {
			showAlertController()
			return
		}
		guard let inputWeightValue = weightTextField.text else {
			showAlertController()
			return
		}
		if !Validation.isSuccsess(inputValue: inputHeightValue) {
			showAlertController()
			return
		}
		if !Validation.isSuccsess(inputValue: inputWeightValue) {
			showAlertController()
			return
		}
		height = Height.init(value: Format.oneDecimalPlace(value: inputHeightValue))
		weight = Weight.init(value: Format.oneDecimalPlace(value: inputWeightValue))
		let bmi = Bmi.init(height: height, weight: weight)
		// TODO: BMI値を表示する
		bmiResultLabel.text = String(bmi.value)
	}
	
	@IBAction func deleteData(_ sender: Any) {
		DataMapper.delete()
	}
	
	@IBAction func saveData(_ sender: Any) {
		guard let inputHeightValue = heightTextField.text else {
			showAlertController()
			return
		}
		guard let inputWeightValue = weightTextField.text else {
			showAlertController()
			return
		}
		if !Validation.isSuccsess(inputValue: inputHeightValue) {
			showAlertController()
			return
		}
		if !Validation.isSuccsess(inputValue: inputWeightValue) {
			showAlertController()
			return
		}
		height = Height.init(value: Format.oneDecimalPlace(value: inputHeightValue))
		weight = Weight.init(value: Format.oneDecimalPlace(value: inputWeightValue))
		let bmi = Bmi.init(height: height, weight: weight)
		var memo = Memo.init(value: "")
		if let inputMemoValue = memoTextField.text {
			memo = Memo.init(value: inputMemoValue)
		} else {
			memo = Memo.init(value: "")
		}
		let user = User.init(height: height, weight: weight, bmi: bmi, memo: memo)
		DataMapper.save(user: user)
	}
	
	private func showAlertController() {
		let alertController = UIAlertController(title: "入力エラー", message: "入力項目に誤りがあります。\n入力し直してください。", preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		self.present(alertController, animated: true, completion: nil)
	}
	
}

