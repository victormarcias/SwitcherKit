//
//  iPhoneScreenSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import Foundation

public class iPhoneScreenSwitchable<T>: BaseSwitchable<T> {
    
    /// iPhone 4
    public func inches_3_5(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.sizeType == .iPhone4
        }
    }
    
    /// iPhone 5, 5s, SE...
    public func inches_4(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.sizeType == .iPhone5
        }
    }
    
    /// iPhone 6, 6s, 7, 8...
    public func inches_4_7(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.sizeType == .iPhone6
        }
    }
    
    /// iPhone 6/7/8... Plus
    public func inches_5_5(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.sizeType == .iPhone6Plus
        }
    }
    
    /// iPhone X, XS...
    public func inches_5_8(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.sizeType == .iPhoneX
        }
    }
    
    /// iPhone XR
    public func inches_6_1(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.sizeType == .iPhoneXR
        }
    }
    
    /// iPhone XS Max
    public func inches_6_5(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.sizeType == .iPhoneXSMax
        }
    }
}

// MARK: - UIScreen helper

fileprivate extension UIScreen {
    
    enum SizeType: CGFloat {
        case unknown = 0.0
        case iPhone4 = 960.0
        case iPhone5 = 1136.0
        case iPhone6 = 1334.0
        case iPhone6Plus = 1920.0
        case iPhoneXR = 1792.0
        case iPhoneX = 2436.0
        case iPhoneXSMax = 2688.0
    }
    
    var sizeType: SizeType {
        let long = max(nativeBounds.height, nativeBounds.width) // works for landscape too
        guard let sizeType = SizeType(rawValue: long) else { return .unknown }
        return sizeType
    }
}
