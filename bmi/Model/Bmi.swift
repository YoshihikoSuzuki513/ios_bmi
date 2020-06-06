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
		self.value = Bmi.calculate(height: height, weight: weight)
	}
	
	private static func calculate(height: Height, weight: Weight) -> Double {
		let result = weight.value / pow(Format.convertToMeters(from: height.value), 2.0)
		return Format.oneDecimalPlace(value: String(result))
	}
	
}
