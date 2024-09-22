//
//  JVConfigurable.swift
//
//
//  Created by Jan Verrept on 19/11/2023.
//

import Foundation

public protocol Configurable:NotificationReceiver{
	
	func observeNotifications() async
	func reloadSettings()
	
}

public extension Configurable {
	
	func observeNotifications() async{
		await self.observeNotifications(using: reloadSettings)
	}
	
	func observeNotifications(using closure: @escaping () -> Void) async {
		for await _ in NotificationCenter.default.notifications(named: Notification.Name(notificationKey)) {
			closure()
		}
	}
}
