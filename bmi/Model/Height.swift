//
//  Height.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

struct Height {
	let value: Double
	
	init(with value: Double) {
		self.value = value
	}
	
	init(with value: String?) throws {
		guard let inputHeight = value, let value = Double(inputHeight) else {
			throw NSError(domain: "身長には数字を入力して下さい", code: -1, userInfo: nil)
		}
		self.value = value
	}
	
}
