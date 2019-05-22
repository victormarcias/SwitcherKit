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
    private var setCount: Int = 0
    
    public var value: T {
        return baseValue
    }
    
    init(_ baseValue: T) {
        self.baseValue = baseValue
    }
    
    internal func switchValue(for specificValue: T, _ condition: SwitchableCondition) -> Self {
        if condition() {
            baseValue = specificValue
            setCount = setCount + 1
            assert(setCount == 1, "Value set more than once. Check your conditions.")
        }
        return self
    }
    
    public func custom(_ specificValue: T, _ condition: SwitchableCondition) -> Self {
        return switchValue(for: specificValue, condition)
    }
}
