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

public extension Configurable{
    
    func observeNotifications(){
        self.observeNotifications(using: reloadSettings)
    }

    
    func observeNotifications(using closure: @escaping () -> Void){
        NotificationCenter.default.addObserver(forName: Notification.Name(notificationKey), object: nil, queue: nil) { notification in
            reloadSettings()
        }
    }
    
}

