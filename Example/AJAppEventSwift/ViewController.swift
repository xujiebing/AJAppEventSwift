//
//  ViewController.swift
//  AJAppEventSwift
//
//  Created by xujiebing on 12/06/2019.
//  Copyright (c) 2019 xujiebing. All rights reserved.
//

import UIKit
import AJKitSwift
import AJAppEventSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let name = "testNotification"
        AJAppEvent.shared.addObserver(observer: self, name: name) { (model) in
            AJPrintLog("")
        }
        AJAppEvent.shared.postNotification(name: name)
    }

    @IBAction func push(_ sender: Any) {
        self.navigationController?.pushViewController(ViewController1.init(), animated: true)
    }
    
    @IBAction func notification(_ sender: Any) {
        AJAppEvent.shared.postNotification(name: "ViewController1")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        AJPrintLog("没有内存泄漏")
    }

}

