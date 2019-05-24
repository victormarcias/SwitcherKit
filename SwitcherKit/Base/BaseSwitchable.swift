//
//  Switchable.swift
//  SwitcherKit
//
//  Created by Victor Marcias on 2019-05-18.
//  Copyright © 2019 Victor Marcias. All rights reserved.
//

import Foundation

public class BaseSwitchable<T> {
    
    // Bool closure used by this class
    public typealias SwitchableCondition = (() -> Bool)
    
    // baseValue is the default value (with no conditions)
    private var baseValue: T
    
    // counter to ensure only ONE value is set per condition
    private var setCount: Int = 0
    
    ///
    /// Public value
    ///
    public var value: T {
        return baseValue
    }
    
    ///
    /// Initializer
    ///
    public init(_ baseValue: T) {
        self.baseValue = baseValue
    }
    
    /// Main function that switches the original wrapped value/object
    /// according to a given condition.
    ///
    /// - parameters:
    ///     - specificValue: the final value/object returned on a successful condition
    ///     - condition: closure used to evaluate a condition
    /// - returns: the wrapped object to easily chain other conditions
    ///
    func switchValue(for specificValue: T, _ condition: SwitchableCondition) -> Self {
        if condition() {
            baseValue = specificValue
            setCount = setCount + 1
            assert(setCount == 1, "Value set more than once. Check your conditions.")
        }
        return self
    }
    
    /// A public customizable condition if non of the implemented meet the needs.
    /// It can be called multiple times as long as the conditions are different.
    ///
    /// - parameters:
    ///     - specificValue: the final value/object returned on a successful condition
    ///     - condition: <customized> closure used to evaluate a condition
    /// - returns: the wrapped object to easily chain other conditions
    ///
    public func custom(_ specificValue: T, _ condition: SwitchableCondition) -> Self {
        return switchValue(for: specificValue, condition)
    }
}
