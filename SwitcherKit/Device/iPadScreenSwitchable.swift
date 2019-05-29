//
//  iPadScreenSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import Foundation

public class iPadScreenSwitchable<T>: BaseSwitchable<T> {
    
    /// iPad minis
    public func inches_7_9(_ value: T) -> Self {
        return switchValue(for: value) {
            return isIPadMini()
        }
    }
    
    /// Regular iPad, iPad Air (1st, 2nd gen)
    public func inches_9_7(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_9_7 && !isIPadMini()
        }
    }
    
    /// iPad Pro (Small), iPad Air (3rd gen)
    public func inches_10_5(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_10_5
        }
    }
    
    /// iPad Pro (Medium)
    public func inches_11(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_11_0
        }
    }
    
    /// iPad Pro (Large)
    public func inches_12_9(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIScreen.main.screenSizeType == .inches_12_9
        }
    }
    
    /// iPad Mini check
    private func isIPadMini() -> Bool {
        let minis = ["iPad2,5", "iPad2,6", "iPad2,7",   // mini
                     "iPad4,4", "iPad4,5", "iPad4,6",   // mini 2
                     "iPad4,7", "iPad4,8", "iPad4,9",   // mini 3
                     "iPad5,1", "iPad5,2",              // mini 4
                     "iPad11,1", "iPad11,2"]            // mini 5
        return minis.contains(UIDevice.current.model)
    }
}

// MARK: - UIScreen helper

fileprivate extension UIScreen {
    
    //
    // https://www.apple.com/ipad/compare/
    //
    enum ScreenSizeType: CGFloat {
        case unknown = 0.0
        case inches_9_7 = 2048.0    // iPad 9.7", iPad mini (7.9"), iPad Air (1st, 2nd)
        case inches_10_5 = 2224.0   // iPad Pro (S), iPad Air (3rd gen)
        case inches_11_0 = 2388.0   // iPad Pro (M)
        case inches_12_9 = 2732.0   // iPad Pro (L)
    }
    
    var screenSizeType: ScreenSizeType {
        let long = max(nativeBounds.height, nativeBounds.width) // works for landscape too
        guard let sizeType = ScreenSizeType(rawValue: long) else { return .unknown }
        return sizeType
    }
}
