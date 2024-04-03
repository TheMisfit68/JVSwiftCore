//
//  JVAppController.swift
//
//
//  Created by Jan Verrept on 08/08/2021.
//

import Foundation
import OSLog

public protocol Shell{
	 	func execute(commandString:String) throws -> String
}


public class AppController{
	let logger = Logger(subsystem: "be.oneclick.JVSwift", category: "AppController")
	
	private let terminal:Shell
    
    public enum AppLocation:String{
        case apps = "/Applications"
        case utilities = "/Applications/Utilities"
        case systemApps = "/System/Applications"
        case systemUtilities = "/System/Applications/Utilities"
    }
    
    let name:String
    
	public init(name:String, location:AppLocation = .apps, terminal:Shell){
		
		self.terminal = terminal
		self.name = name
		
	}
    
    public var isInstalled:Bool{
        
        do{
			let installedApps = try terminal.execute(commandString:"ls /Applications")
            return installedApps.containsSubstring(name)
        }catch{
            logger.error("\(error.localizedDescription)")
            return false
        }
    }
    
    public func startIfInstalled(){
        if isInstalled{
            start()
        }
    }
    
    public func start(){
        
        do{
			_ = try terminal.execute(commandString:"open -a \(name)")
        }catch{
            logger.error("\(error.localizedDescription)")
        }
        
    }
    
    public func quit(){
        
		do{
			_ = try terminal.execute(commandString:"pkill -x \(name)")
		}catch{
            logger.error("\(error.localizedDescription)")
        }
        
    }
	
	public func killOldAppInstances() {
		
		do {
			_ = try terminal.execute(commandString: "pkill -x -o \(name)")
			
		} catch {
			logger.error("\(error.localizedDescription)")
		}
		
	}
    
}


public class AppNapController:Singleton{
    
    public static let shared:AppNapController = AppNapController()
    private init(){}
    
    var permanentActivity:NSObjectProtocol!
    
    public func keepAlive(){
        disable()
    }
    
    private func disable(){
        
        permanentActivity = ProcessInfo.processInfo.beginActivity(
            options: ProcessInfo.ActivityOptions.userInitiated,
            reason: "Keeping this App alive")
        
    }
    
    public func enable(){
        ProcessInfo.processInfo.endActivity(permanentActivity)
    }
    
}
