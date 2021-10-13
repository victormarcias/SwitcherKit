//
//  iPhoneScreenSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import UIKit

public class iPhoneScreenSwitchable<T>: BaseSwitchable<T> {
    
	//
	// https://www.apple.com/iphone/compare/
	//
	public enum ScreenSizeType: CGFloat {
		case unknown = 0.0
		case inches_3_5 = 960           // iPhone 4
		case inches_4 = 1136            // iPhone 5, 5s, SE, Touch...
		case inches_4_7 = 1334          // iPhone 6, 7, 8...
		case inches_5_4 = 2340          // iPhone 1x Mini
		case inches_5_5 = 1920          // iPhone 6/7/8 Plus...
		case inches_5_8 = 2436          // iPhone XR
		case inches_6_1 = 1792          // iPhone X, XR, XS...
		case inches_6_1_Pro = 2532      // iPhone 12, 13...
		case inches_6_5 = 2688          // iPhone XS Max
		case inches_6_7_Pro = 2778      // iPhone Pro Max
	}
    
	public func size(_ inches: ScreenSizeType, _ value: T) -> Self {
		return switchValue(for: value) {
            let screen = max(UIScreen.main.nativeBounds.height,
                             UIScreen.main.nativeBounds.width) // works for landscape too
            return screen == inches.rawValue
		}
	}
}
