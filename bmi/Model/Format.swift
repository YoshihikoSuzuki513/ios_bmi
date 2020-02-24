//
//  Format.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

class Format {
	
	static func oneDecimalPlace(value: String) -> Double {
		guard let doubleValue = Double(value) else {
			return Double(0)
		}
		let formatedValue = String(format: "%.1f", doubleValue)
		let result = NSString(string: formatedValue).doubleValue
		return result
	}
	
}
