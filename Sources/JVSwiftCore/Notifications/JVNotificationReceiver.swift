//
//  JVNotificationReceiver.swift.swift
//
//
//  Created by Jan Verrept on 19/11/2023.
//

import Foundation

public protocol NotificationReceiver{
    
    var notificationKey: String { get }
    func observeNotifications(using closure: @escaping () -> Void) async
    
}

