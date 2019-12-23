//
//  String+AJAppEvent.swift
//  AJAppEventSwift
//
//  Created by 徐结兵 on 2019/12/21.
//

extension String {
    var notificationName: Notification.Name {
        get {
            return Notification.Name.init(self)
        }
    }
}
