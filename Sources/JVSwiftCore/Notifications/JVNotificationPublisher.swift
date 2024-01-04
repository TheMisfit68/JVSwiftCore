//
//  JVNotificationPublisher.swift
//
//
//  Created by Jan Verrept on 19/11/2023.
//

import Foundation

public protocol NotificationPublisher{
    
    var notificationKey: String { get }
    func postNotification()

}
