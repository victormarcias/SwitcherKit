//
//  iOSDeviceSwitch.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-24.
//

import Foundation

public class iOSDeviceSwitch: iOSDeviceSwitchable<()->Void> {
    
    ///
    /// Execute will apply the value according to its conditions
    ///
    public func execute() {
        self.value()
    }
}
