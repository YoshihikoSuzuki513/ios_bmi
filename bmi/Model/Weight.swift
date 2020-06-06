//
//  Weight.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

struct Weight {
	let value: Double
	
	init(with value: Double) {
		self.value = value
	}
	
	init(with value: String?) throws {
		guard let inputValue = value, let value = Double(inputValue) else {
			throw NSError(domain: "体重には数字を入力して下さい", code: -1, userInfo: nil)
		}
		self.value = value
	}
	
}
