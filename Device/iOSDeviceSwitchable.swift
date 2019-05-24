//
//  iOSDeviceSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import UIKit

public class iOSDeviceSwitchable<T>: BaseSwitchable<T> {
    
    public func iPhone(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIDevice.current.model.lowercased().contains("iphone")
        }
    }
    
    public func iPad(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIDevice.current.model.lowercased().contains("ipad")
        }
    }
    
    public func iPod(_ value: T) -> Self {
        return switchValue(for: value) {
            return UIDevice.current.model.lowercased().contains("ipod")
        }
    }
}
