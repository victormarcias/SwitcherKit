//
//  iOSVersionSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

public class iOSVersionSwitchable<T>: BaseSwitchable<T> {
    
    public func iOS_8(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 9, *) { return false }
            if #available(iOS 8, *) { return true }
            return false
        }
    }
    
    public func iOS_9(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 10, *) { return false }
            if #available(iOS 9, *) { return true }
            return false
        }
    }
    
    public func iOS_10(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 11, *) { return false }
            if #available(iOS 10, *) { return true }
            return false
        }
    }
    
    public func iOS_11(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 12, *) { return false }
            if #available(iOS 11, *) { return true }
            return false
        }
    }
    
    public func iOS_12(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 13, *) { return false }
            if #available(iOS 12, *) { return true }
            return false
        }
    }
    
    public func iOS_13(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 14, *) { return false }
            if #available(iOS 13, *) { return true }
            return false
        }
    }
    
    public func iOS_14(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 15, *) { return false }
            if #available(iOS 14, *) { return true }
            return false
        }
    }
}
