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
    
    private lazy var demoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
    private func addText(_ text: String?) {
        guard let text = text else { return }
        demoLabel.text = "\(demoLabel.text ?? "") \n\(text)"
        demoLabel.sizeToFit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        demoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(demoLabel)
        demoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        demoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        demoLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
		// MARK: - iOS Version example
        
        let iOSswitchable = iOSVersionSwitchable<Int>(1)
            .iOS_8(8)
            .iOS_9(9)
            .iOS_10(10)
            .iOS_11(11)
            .iOS_12(12)
            .iOS_13(13)
            .iOS_14(14)
		
        addText("iOS Version \(iOSswitchable.value)")
		
		iOSVersionSwitch {
            self.addText("This is a Demo.")
        }.iOS_11 {
            self.addText("This is iOS 11.")
		}.iOS_12 {
            self.addText("This is iOS 12.")
		}.execute()
		
		// MARK: - Platform example
		
        let platformSwitch = PlatformSwitchable<String>("Where am I? 🤔")
            .android("You are in the wrong platform. 🤪")
            .iOS("I'm on iPhone")
            .tvOS("I'm on TV")
            .watchOS("I'm on a Apple Watch")
            .windows("I'm on Windows")
            .linux("I'm on Linux")
        
        self.addText(platformSwitch.value)
        		
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
		
        iPhoneScreenSwitch { self.addText("iPhone screen size not handled") }
			.size(.inches_3_5) { self.addText("iPhone 4") }
			.size(.inches_4) { self.addText("iPhone 5 or SE") }
			.size(.inches_4_7) { self.addText("iPhone 6, 7, 8") }
			.size(.inches_5_4) { self.addText("iPhone 1x mini") }
			.size(.inches_5_5) { self.addText("iPhone 6,7,8 Plus") }
			.size(.inches_6_1) { self.addText("iPhone X, Xs...") }
			.size(.inches_6_5) { self.addText("iPhone Pro / Max") }
            .execute()
		
		view.backgroundColor = iPhoneScreenSwitchable<UIColor>(.black)
            .size(.inches_3_5, .gray)
            .size(.inches_4, .darkGray)
            .size(.inches_4_7, .red)
            .size(.inches_5_4, .green)
            .size(.inches_5_5, .brown)
            .size(.inches_6_1, .orange)
            .size(.inches_6_5, .purple)
            .size(.inches_6_1_Pro, .cyan)
            .size(.inches_6_7_Pro, .magenta)
			.value
    }
}
