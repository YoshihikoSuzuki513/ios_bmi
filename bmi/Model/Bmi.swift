//
//  Bmi.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

class Bmi {
	let value: Double
	
	init(height: Height, weight: Weight) {
		self.value = Bmi.getBmi(height: height, weight: weight)
	}
	
	static func getBmi(height: Height, weight: Weight) -> Double {
		return weight.value / pow(height.value, 2.0)
	}
	
}
