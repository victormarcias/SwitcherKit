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
            .iOS_13(13)
        
        print(iOSswitchable.value)
        
        let platformSwitch = PlatformSwitchable<String>("Where am I?")
            .iOS("I'm on iPhone")
            .tvOS("I'm on TV")
            .watchOS("I'm on a watch")
            .windows("I'm on Windows")
            .linux("I'm on Linux")
        
        print(platformSwitch.value)
        
        iOSVersionSwitch {
            print("Hello hello")
        }.iOS_12 {
            print("This is iOS 12")
        }.execute()
        
        view.backgroundColor = iOSDeviceSwitchable<UIColor>(.red)
            .iPad(.green)
            .iPod(.purple)
            .value
        
        view.backgroundColor = ConfigurationSwitchable<UIColor>(debug: .red, release: .black)
            .adhoc(.brown)
            .value
        
        ConfigurationSwitch(debug: {
            //
        }, release: {
            //
        }).execute()
        
        iPhoneScreenSwitch { print("Inches") }
            .inches_3_5 { print("3.5 inch") }
            .inches_4 { print("4 inch") }
            .inches_4_7 { print("4.7 inch") }
            .inches_5_5 { print("5.5 inch") }
            .inches_6_1 { print("6.1 inch") }
            .inches_6_5 { print("6.5 inch") }
            .execute()
    }
}
