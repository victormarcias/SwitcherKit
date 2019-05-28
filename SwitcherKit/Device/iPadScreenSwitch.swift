//
//  iPadScreenSwitch.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-28.
//

import Foundation

public class iPadScreenSwitch: iPadScreenSwitchable<()->Void> {
    
    ///
    /// Execute will apply the value according to its conditions
    ///
    public func execute() {
        self.value()
    }
}
