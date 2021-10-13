//
//  PlatformSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-23.
//

import Foundation

public class PlatformSwitchable<T>: BaseSwitchable<T> {
    
    public func simulator(_ value: T) -> Self {
        return switchValue(for: value) {
            #if targetEnvironment(simulator)
            return true
            #else
            return false
            #endif
        }
    }
    
    public func iOS(_ value: T) -> Self {
        return switchValue(for: value) {
            #if os(iOS)
            return true
            #else
            return false
            #endif
        }
    }
    
    public func tvOS(_ value: T) -> Self {
        return switchValue(for: value) {
            #if os(tvOS)
            return true
            #else
            return false
            #endif
        }
    }
    
    public func watchOS(_ value: T) -> Self {
        return switchValue(for: value) {
            #if os(watchOS)
            return true
            #else
            return false
            #endif
        }
    }
    
    public func macOS(_ value: T) -> Self {
        return switchValue(for: value) {
            #if os(macOS)
            return true
            #else
            return false
            #endif
        }
    }
    
    public func linux(_ value: T) -> Self {
        return switchValue(for: value) {
            #if os(Linux)
            return true
            #else
            return false
            #endif
        }
    }
    
    public func windows(_ value: T) -> Self {
        return switchValue(for: value) {
            #if os(Windows)
            return true
            #else
            return false
            #endif
        }
    }
    
    public func android(_ value: T) -> Self {
        return switchValue(for: value) {
            #if os(Android)
            return true
            #else
            return false
            #endif
        }
    }
}
