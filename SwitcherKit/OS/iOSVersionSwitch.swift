//
//  iOSVersionSwitch.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-23.
//

import Foundation

public class iOSVersionSwitch: iOSVersionSwitchable<()->Void> {
    
    public func execute() {
        self.value()
    }
}
