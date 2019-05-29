//
//  iPhoneScreenSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import UIKit

public class iPhoneScreenSwitchable<T>: BaseSwitchable<T> {
    
    /// iPhone 4
    public func inches_3_5(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_3_5
        }
    }
    
    /// iPhone 5, 5s, SE...
    public func inches_4(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_4
        }
    }
    
    /// iPhone 6, 6s, 7, 8...
    public func inches_4_7(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_4_7
        }
    }
    
    /// iPhone 6/7/8... Plus
    public func inches_5_5(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_5_5
        }
    }
    
    /// iPhone X, XS...
    public func inches_5_8(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_5_8
        }
    }
    
    /// iPhone XR
    public func inches_6_1(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_6_1
        }
    }
    
    /// iPhone XS Max
    public func inches_6_5(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_6_5
        }
    }
}

// MARK: - UIScreen helper

fileprivate extension UIScreen {
    
    //
    // https://www.apple.com/iphone/compare/
    //
    enum ScreenSizeType: CGFloat {
        case unknown = 0.0
        case inches_3_5 = 960.0     // iPhone 4
        case inches_4 = 1136.0      // iPhone 5, 5s, SE...
        case inches_4_7 = 1334.0    // iPhone 6, 7, 8...
        case inches_5_5 = 1920.0    // iPhone 6/7/8 Plus...
        case inches_6_1 = 1792.0    // iPhone X, XS...
        case inches_5_8 = 2436.0    // iPhone XR
        case inches_6_5 = 2688.0    // iPhone XS Max
    }
    
    var screenSizeType: ScreenSizeType {
        let long = max(nativeBounds.height, nativeBounds.width) // works for landscape too
        guard let sizeType = ScreenSizeType(rawValue: long) else { return .unknown }
        return sizeType
    }
}
