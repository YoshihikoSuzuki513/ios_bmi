//
//  User.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

class User {
	let height: Height
	let weight: Weight
	let bmi: Bmi
	let memo: Memo
	
	init(height: Height, weight: Weight, bmi: Bmi, memo: Memo) {
		self.height = height
		self.weight = weight
		self.bmi = bmi
		self.memo = memo
	}
	
}
