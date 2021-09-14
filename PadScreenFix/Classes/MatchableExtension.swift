//
//  NatchableState.swift
//  PadScreenFix
//
//  Created by jimmy on 2021/9/14.
//

import Foundation

public protocol MatchableProtocol {
    func p97(value: Self) -> Self
    func p102(value: Self) -> Self
    func p105(value: Self) -> Self
    func p11(value: Self) -> Self
    func p129(value: Self) -> Self
}

extension MatchableProtocol {
    public func p97(value: Self) -> Self {
        return matchScreen(.p97, value: value)
    }
    public func p102(value: Self) -> Self {
        return matchScreen(.p102, value: value)
    }
    public func p105(value: Self) -> Self {
        return matchScreen(.p105, value: value)
    }
    public func p11(value: Self) -> Self {
        return matchScreen(.p11, value: value)
    }
    public func p129(value: Self) -> Self {
        return matchScreen(.p129, value: value)
    }
    
    func matchScreen(_ screen: PadScreenFitConfig.Screen, value: Self) -> Self {
        if screen == PadScreenFitConfig.current {
            return value
        }
        return self
    }
}

