//
//  Memo.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

class Memo {
	let value: String
	
	init(with value: String?) {
		guard let value = value else {
			self.value = ""
			return
		}
		self.value = value
	}
	
}
