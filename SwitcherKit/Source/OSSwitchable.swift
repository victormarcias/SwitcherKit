//
//  OSSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

public class OSSwitchable<T>: BaseSwitchable<T> {
    
    func iOS9(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 10, *) { return false }
            if #available(iOS 9, *) { return true }
            return false
        }
    }
    
    func iOS10(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 11, *) { return false }
            if #available(iOS 10, *) { return true }
            return false
        }
    }
    
    func iOS11(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 12, *) { return false }
            if #available(iOS 11, *) { return true }
            return false
        }
    }
    
    func iOS12(_ value: T) -> Self {
        return switchValue(for: value) {
            if #available(iOS 13, *) { return false }
            if #available(iOS 12, *) { return true }
            return false
        }
    }
}
