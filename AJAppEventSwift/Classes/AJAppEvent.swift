//
//  AJAppEvent.swift
//  AJAppEventSwift
//
//  Created by 徐结兵 on 2019/12/20.
//

import UIKit

public typealias AJAppEventBlock = (Notification) -> Void

public class AJAppEvent: NSObject {
    
    var observerDic = [String: AJAppEventBlock]()
    
    public func addObserver(name: String, block: @escaping AJAppEventBlock) {
        guard let _ = self.observerDic[name] else {
            self.observerDic[name] = block
            NotificationCenter.default.addObserver(self, selector: #selector(notificationEvent(notification:)), name: name.notificationName, object: nil)
            return
        }
    }
    
    public static func postNotification(name: String) {
        NotificationCenter.default.post(name: name.notificationName, object: nil)
    }
    
    public static func postNotification(name: String, object: Any) {
        NotificationCenter.default.post(name: name.notificationName, object: object)
    }
    
    public static func postNotification(name: String, object: Any?, userInfo: [AnyHashable:Any]) {
        NotificationCenter.default.post(name: name.notificationName, object: object, userInfo: userInfo)
    }
    
    public func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    public func removeObserver(name: String) {
        NotificationCenter.default.removeObserver(self, name: name.notificationName, object: nil)
    }
    
    public func didEnterBackground(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationDidEnterBackground.rawValue, block: block)
    }
    
    public func WillEnterForeground(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationWillEnterForeground.rawValue, block: block)
    }
    
    public func didFinishLaunching(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationDidFinishLaunching.rawValue, block: block)
    }
    
    public func didBecomeActive(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationDidBecomeActive.rawValue, block: block)
    }
    
    public func willResignActive(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationWillResignActive.rawValue, block: block)
    }
    
    public func willTerminate(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationWillTerminate.rawValue, block: block)
    }
    
    public func didReceiveMemoryWarning(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationDidReceiveMemoryWarning.rawValue, block: block)
    }
    
    public func significantTimeChange(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationSignificantTimeChange.rawValue, block: block)
    }
    
    public func willChangeStatusBarOrientation(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationWillChangeStatusBarOrientation.rawValue, block: block)
    }
    
    public func didChangeStatusBarOrientation(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationDidChangeStatusBarOrientation.rawValue, block: block)
    }
    
    public func willChangeStatusBarFrame(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationWillChangeStatusBarFrame.rawValue, block: block)
    }
    
    public func didChangeStatusBarFrame(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationDidChangeStatusBarFrame.rawValue, block: block)
    }
    
    public func backgroundRefreshStatusDidChange(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationBackgroundRefreshStatusDidChange.rawValue, block: block)
    }
    
    public func protectedDataWillBecomeUnavailable(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationProtectedDataWillBecomeUnavailable.rawValue, block: block)
    }
    
    public func protectedDataDidBecomeAvailable(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationProtectedDataDidBecomeAvailable.rawValue, block: block)
    }
    
    public func userDidTakeScreenshot(block: @escaping AJAppEventBlock) {
        self.addObserver(name: Notification.Name.UIApplicationUserDidTakeScreenshot.rawValue, block: block)
    }

    @objc func notificationEvent(notification: Notification) {
        guard let block = self.observerDic[notification.name.rawValue] else { return }
        
        block(notification)
//        for block in blockArray {
//        }
    }
}


