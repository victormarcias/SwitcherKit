//
//  ViewController.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit
import SwitcherKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let iOSswitchable = iOSVersionSwitchable<Int>(1)
            .iOS_8(8)
            .iOS_9(9)
            .iOS_10(10)
            .iOS_11(11)
            .iOS_12(12)
            .custom(99) { () -> Bool in
                return false
            }
        
        print(iOSswitchable.value)
        
        let OSswitchable = OSSwitchable<String>("Where am I?")
            .iOS("I'm on iPhone")
            .tvOS("I'm on TV")
            .watchOS("I'm on a watch")
            .windows("I'm on Windows")
            .linux("I'm on Linux")
        
        print(OSswitchable.value)
        
        iOSVersionSwitch {
            print("Hello hello")
        }.iOS_12 {
            print("This is iOS 12")
        }.execute()
        
        view.backgroundColor = iOSDeviceSwitchable<UIColor>(.red)
            .iPad(.green)
            .iPod(.purple)
            .value
        
        view.backgroundColor = ConfigurationSwitchable<UIColor>(debug: .red)
            .release(.white)
            .value
        
        ConfigurationSwitch(debug: {
            //
        }).release {
            //
        }.execute()
    }
}
