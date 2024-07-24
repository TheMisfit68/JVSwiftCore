//
//  JVConfigurable.swift
//
//
//  Created by Jan Verrept on 19/11/2023.
//

import Foundation

public protocol Configurable:NotificationReceiver{
	
	func observeNotifications()
	func reloadSettings()
	
}

public extension Configurable {
	
	func observeNotifications() {
		self.observeNotifications(using: reloadSettings)
	}
	
	func observeNotifications(using closure: @escaping () async -> Void) async {
		for await _ in NotificationCenter.default.notifications(named: Notification.Name(notificationKey)) {
			await closure()
		}
	}
}
