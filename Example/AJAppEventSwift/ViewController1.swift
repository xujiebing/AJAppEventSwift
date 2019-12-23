//
//  ViewController1.swift
//  AJAppEventSwift_Example
//
//  Created by 徐结兵 on 2019/12/22.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import AJKitSwift
import AJAppEventSwift

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let name = "ViewController1"
        AJAppEvent.shared.addObserver(observer: self, name: name) { (notificaiton) in
            AJPrintLog("")
        }
    }
    
    deinit {
        AJPrintLog("ViewController1没有内存泄露")
        NotificationCenter.default.removeObserver(AJAppEvent.shared, name: Notification.Name.init("ViewController1"), object: nil)
    }

}
