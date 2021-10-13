//
//  ViewController.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import UIKit
import SwitcherKit

class DemoViewController: UIViewController {
    
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
			.size(.inches_3_5) { print("iPhone 4") }
			.size(.inches_4) { print("iPhone 5 or SE") }
			.size(.inches_4_7) { print("iPhone 6, 7, 8") }
			.size(.inches_5_4) { print("iPhone 1x mini") }
			.size(.inches_5_5) { print("iPhone 6,7,8 Plus") }
			.size(.inches_6_1) { print("iPhone X, Xs...") }
			.size(.inches_6_5) { print("iPhone Pro / Max") }
            .execute()
		
		view.backgroundColor = iPhoneScreenSwitchable<UIColor>(.white)
            .size(.inches_3_5, .gray)
			.size(.inches_4, .darkGray)
			.size(.inches_4_7, .red)
			.size(.inches_5_4, .green)
			.size(.inches_5_5, .brown)
			.size(.inches_6_1, .orange)
            .size(.inches_6_1_Pro, .cyan)
            .size(.inches_6_5, .brown)
            .size(.inches_6_7_Pro, .magenta)
			.value
    }
}
