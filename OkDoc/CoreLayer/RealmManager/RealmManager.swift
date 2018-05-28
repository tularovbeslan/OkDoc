//
//  RealmManager.swift
//  OkDoc
//
//  Created by workmachine on 27.05.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager {
	
	private let NotificationError = Notification.Name(rawValue: "NotificationError")
	
	var realm = try! Realm()
	
	func create<T: Object>(_ object: T) {
		do {
			try realm.write {
				realm.add(object)
			}
		} catch {
			post(error)
		}
	}
	
	func read<T: Object>(_ object: T) -> Results<T> {
		let result = realm.objects(type(of: object))
		return result
	}
	
	func update<T: Object>(_ object: T, with dictionary: [String: Any]) {
		do {
			try realm.write {
				for (key, value) in dictionary {
					object.setValue(value, forKey: key)
				}
			}
		} catch {
			post(error)
		}
	}
	
	func delete<T: Object>(_ object: T) {
		do {
			try realm.write {
				realm.delete(object)
			}
		} catch {
			post(error)
		}
	}
	
	func post(_ error: Error) {
		NotificationCenter.default.post(name: NotificationError, object: error)
	}
	
	func observeRealErrors(in viewController: UIViewController, complation: @escaping (Error?) -> Void) {
		NotificationCenter.default.addObserver(forName: NotificationError, object: viewController, queue: nil) { (notification) in
			complation(notification.object as? Error)
		}
	}
	
	func stopObserveRealErrors(in viewController: UIViewController) {
		NotificationCenter.default.removeObserver(viewController, name: NotificationError, object: nil)
	}
}
