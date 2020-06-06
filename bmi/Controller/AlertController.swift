//
//  AlertViewController.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/06/06.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import UIKit

class AlertController {
	
	static func showAlertController(viewController: UIViewController) {
		let alertController = UIAlertController(title: "入力エラー", message: "入力項目に誤りがあります。\n入力し直してください。", preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		viewController.present(alertController, animated: true, completion: nil)
	}
	
}
