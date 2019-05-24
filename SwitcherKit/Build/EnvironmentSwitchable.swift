//
//  EnvironmentSwitchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import Foundation

public class EnvironmentSwitchable<T>: BaseSwitchable<T> {
    
    open func development(_ value: T) -> Self {
        return switchValue(for: value) {
            // use this defines or override func
            #if ENVIRONMENT_DEVELOPMENT || ENV_DEVELOPMENT || ENV_DEV
            return true
            #else
            return false
            #endif
        }
    }
    
    open func staging(_ value: T) -> Self {
        return switchValue(for: value) {
            // use this defines or override func
            #if ENVIRONMENT_STAGING || ENV_STAGING
            return true
            #else
            return false
            #endif
        }
    }
    
    open func qa(_ value: T) -> Self {
        return switchValue(for: value) {
            // use this defines or override func
            #if ENVIRONMENT_QA || ENV_QA
            return true
            #else
            return false
            #endif
        }
    }
    
    open func production(_ value: T) -> Self {
        return switchValue(for: value) {
            // use this defines or override func
            #if ENVIRONMENT_PRODUCTION || ENV_PRODUCTION || ENV_PROD
            return true
            #else
            return false
            #endif
        }
    }
}
