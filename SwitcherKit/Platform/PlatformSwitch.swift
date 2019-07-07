//
//  PlatformSwitch.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-23.
//

import Foundation

public class PlatformSwitch: PlatformSwitchable<()->Void> {
    
    ///
    /// Execute will apply the value according to its conditions
    ///
    public func execute() {
        self.value()
    }
}
