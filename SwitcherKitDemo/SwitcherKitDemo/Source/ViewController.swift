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
        
		// MARK: - iOS Version example
		
        let iOSswitchable = iOSVersionSwitchable<Int>(1)
            .iOS_8(8)
            .iOS_9(9)
            .iOS_10(10)
            .iOS_11(11)
            .iOS_12(12)
            .iOS_13(13)
            .iOS_14(14)
		
        print(iOSswitchable.value)
		
		iOSVersionSwitch {
			print("Hello hello")
		}.iOS_12 {
			print("This is iOS 12")
		}.execute()
		
		// MARK: - Platform example
		
        let platformSwitch = PlatformSwitchable<String>("Where am I?")
            .iOS("I'm on iPhone")
            .tvOS("I'm on TV")
            .watchOS("I'm on a watch")
            .windows("I'm on Windows")
            .linux("I'm on Linux")
        
        print(platformSwitch.value)
        		
		// MARK: - Device Type example
		
        view.backgroundColor = iOSDeviceSwitchable<UIColor>(.red)
            .iPad(.green)
            .iPod(.purple)
            .value
        
		// MARK: - Build Configuration example
		
        view.backgroundColor = ConfigurationSwitchable<UIColor>(debug: .red, release: .black)
            .adhoc(.brown)
            .value
        
        ConfigurationSwitch(debug: {
            // setup Debug
        }, release: {
            // setup Release
        }).execute()
        
		// MARK: - Screen Size Example
		
        iPhoneScreenSwitch { print("Inches") }
            .inches_3_5 { print("3.5 inch") }
            .inches_4 { print("4 inch") }
            .inches_4_7 { print("4.7 inch") }
			.inches_5_4 { print("5.4 inch") }
            .inches_5_5 { print("5.5 inch") }
            .inches_6_1 { print("6.1 inch") }
            .inches_6_5 { print("6.5 inch") }
            .execute()
		
		view.backgroundColor = iPhoneScreenSwitchable<UIColor>(.white)
			.inches_3_5(.lightGray)
			.inches_4(.red)
			.inches_4_7(.blue)
			.inches_5_4(.orange)
			.inches_5_5(.purple)
			.inches_6_1(.cyan)
			.value
    }
}
