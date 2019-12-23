//
//  AJAppEvent.swift
//  AJAppEventSwift
//
//  Created by 徐结兵 on 2019/12/20.
//

import UIKit

public typealias AJAppEventBlock = (Notification) -> Void

public class AJAppEvent: NSObject {
    
    var observerDic = [String: [AJAppEventBlock]]()
    
    public static let shared = AJAppEvent.init()
    private override init() {
        super.init()
    }
    
    public func addObserver(observer: Any, name: String, block: @escaping AJAppEventBlock) {
        self.addObserver(name: name, block: block)
        NotificationCenter.default.addObserver(self, selector: #selector(notificationEvent(notification:)), name: name.notificationName, object: nil)
    }
    
    public func postNotification(name: String) {
        NotificationCenter.default.post(name: name.notificationName, object: nil)
    }
    
    public func postNotification(name: String, object: Any) {
        NotificationCenter.default.post(name: name.notificationName, object: object)
    }
    
    public func postNotification(name: String, object: Any?, userInfo: [AnyHashable:Any]) {
        NotificationCenter.default.post(name: name.notificationName, object: object, userInfo: userInfo)
    }
    
    public func removeObserver(observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    public func removeObserver(observer: Any, name: String) {
        NotificationCenter.default.removeObserver(observer, name: name.notificationName, object: nil)
    }
    
    public func didEnterBackground(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationDidEnterBackground.rawValue, block: block)
    }
    
    public func WillEnterForeground(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationWillEnterForeground.rawValue, block: block)
    }
    
    public func didFinishLaunching(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationDidFinishLaunching.rawValue, block: block)
    }
    
    public func didBecomeActive(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationDidBecomeActive.rawValue, block: block)
    }
    
    public func willResignActive(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationWillResignActive.rawValue, block: block)
    }
    
    public func willTerminate(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationWillTerminate.rawValue, block: block)
    }
    
    public func didReceiveMemoryWarning(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationDidReceiveMemoryWarning.rawValue, block: block)
    }
    
    public func significantTimeChange(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationSignificantTimeChange.rawValue, block: block)
    }
    
    public func willChangeStatusBarOrientation(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationWillChangeStatusBarOrientation.rawValue, block: block)
    }
    
    public func didChangeStatusBarOrientation(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationDidChangeStatusBarOrientation.rawValue, block: block)
    }
    
    public func willChangeStatusBarFrame(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationWillChangeStatusBarFrame.rawValue, block: block)
    }
    
    public func didChangeStatusBarFrame(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationDidChangeStatusBarFrame.rawValue, block: block)
    }
    
    public func backgroundRefreshStatusDidChange(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationBackgroundRefreshStatusDidChange.rawValue, block: block)
    }
    
    public func protectedDataWillBecomeUnavailable(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationProtectedDataWillBecomeUnavailable.rawValue, block: block)
    }
    
    public func protectedDataDidBecomeAvailable(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationProtectedDataDidBecomeAvailable.rawValue, block: block)
    }
    
    public func userDidTakeScreenshot(observer: Any, block: @escaping AJAppEventBlock) {
        self.addObserver(observer: observer, name: Notification.Name.UIApplicationUserDidTakeScreenshot.rawValue, block: block)
    }

    func addObserver(name: String, block: @escaping AJAppEventBlock) {
        guard let _ = self.observerDic[name] else {
            self.observerDic[name] = [block]
            return;
        }
        self.observerDic[name]!.append(block)
    }
    
    @objc func notificationEvent(notification: Notification) {
        guard let blockArray = self.observerDic[notification.name.rawValue] else { return }
        for block in blockArray {
            block(notification)
        }
    }
}


