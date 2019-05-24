//
//  ConfigurationSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import Foundation

public class ConfigurationSwitchable<T>: BaseSwitchable<T> {
    
    public required init(debug: T) {
        super.init(debug)
        
        let _ = switchValue(for: debug) {
            #if DEBUG
            return true
            #else
            return false
            #endif
        }
    }
    
    open func adhoc(_ value: T) -> Self {
        return switchValue(for: value) {
            #if ADHOC
            return true
            #else
            return false
            #endif
        }
    }
    
    open func release(_ value: T) -> Self {
        return switchValue(for: value) {
            #if !ADHOC && !DEBUG
            return true
            #else
            return false
            #endif
        }
    }
}
