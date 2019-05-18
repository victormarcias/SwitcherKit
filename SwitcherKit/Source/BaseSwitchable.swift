//
//  Switchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

public class BaseSwitchable<T> {
    
    public typealias SwitchableCondition = (() -> Bool)
    
    private var baseValue: T
    
    init(_ baseValue: T) {
        self.baseValue = baseValue
    }
    
    func switchValue(for specificValue: T, _ condition: SwitchableCondition) -> T {
        if condition() {
            baseValue = specificValue
        }
        return baseValue
    }
    
    public func custom(_ specificValue: T, _ condition: SwitchableCondition) -> T {
        return switchValue(for: specificValue, condition)
    }
}
