//
//  ConfigurationSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import Foundation

public class ConfigurationSwitchable<T>: BaseSwitchable<T> {
    
    // This switch must have a debug and release path
    public required init(debug: T, release: T) {
        super.init(debug)
        
        let _ = switchValue(for: debug) {
            // use this defines or override func
            #if DEBUG
            return true
            #else
            return false
            #endif
        }
        
        let _ = switchValue(for: release) {
            // use this defines or override func
            #if (!DEBUG && !ADHOC) || RELEASE
            return true
            #else
            return false
            #endif
        }
    }
    
    open func adhoc(_ value: T) -> Self {
        return switchValue(for: value) {
            // use this define or override func
            #if ADHOC
            return true
            #else
            return false
            #endif
        }
    }
}
