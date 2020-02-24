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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if textField.tag == 0 {
			weightTextField.becomeFirstResponder()
			// TODO: 体重テキストにフォーカスする
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
			// TODO: アラート表示
			return
		}
		guard let inputWeightValue = weightTextField.text else {
			// TODO: アラート表示
			return
		}
		if !Validation.isSuccsess(inputValue: inputHeightValue) {
			// TODO: アラート表示
			return
		}
		if !Validation.isSuccsess(inputValue: inputWeightValue) {
			// TODO: アラート表示
			return
		}
		let height = Height.init(value: Format.oneDecimalPlace(value: inputHeightValue))
		let weight = Weight.init(value: Format.oneDecimalPlace(value: inputWeightValue))
	}
	
}

