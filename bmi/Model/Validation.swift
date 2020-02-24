//
//  Validation.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

class Validation {
	
	static func isSuccsess(inputValue: String) -> Bool {
		if Double(inputValue) == nil {
			return false
		}
		if inputValue.isEmpty {
			return false
		}
		return true
	}
	
}
