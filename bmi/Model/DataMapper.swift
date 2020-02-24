//
//  DataMapper.swift
//  bmi
//
//  Created by 鈴木義彦 on 2020/02/24.
//  Copyright © 2020 Yoshihiko Suzuki. All rights reserved.
//

import Foundation

class DataMapper {
	
	static func getDate() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMMdd", options: 0, locale: Locale(identifier: "ja_JP"))
		let key = dateFormatter.string(from: Date())
		return key
	}
	
	static func getHistoryData() -> Array<Dictionary<String, Any>> {
		guard let saveKeys = UserDefaults.standard.array(forKey: "saveKeys") else {
			return Array<Dictionary<String, Any>>()
		}
		var result = [Dictionary<String, Any>]()
		for key in saveKeys {
			if let key = key as? String, let history = UserDefaults.standard.dictionary(forKey: key) {
				result.append(history)
			}
		}
		return result
	}
 
	static func save(user: User) {
		let userDic: Dictionary<String, Any> = [
			"height": user.height.value,
			"weight": user.weight.value,
			"bmi": user.bmi.value,
			"memo": user.memo.value
		]
		UserDefaults.standard.set(userDic, forKey: getDate())
		guard var saveKeys: [String] = UserDefaults.standard.array(forKey: "saveKeys") as? [String] else {
			let saveKeys = [getDate()]
			UserDefaults.standard.set(saveKeys, forKey: "saveKeys")
			UserDefaults.standard.synchronize()
			return
		}
		saveKeys.append(getDate())
		UserDefaults.standard.set(saveKeys, forKey: "saveKeys")
		UserDefaults.standard.synchronize()
	}

	static func delete() {
		UserDefaults.standard.removeObject(forKey: getDate())
	}
	
}
