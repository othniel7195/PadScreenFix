//
//  File.swift
//  PadScreenFix
//
//  Created by jimmy on 2021/9/14.
//

import Foundation

public struct PadFitManger {
    
    private static var fontRule: PadFitRule = .default
    private static var inchRule: PadFitRule = .default
    
    
    public static func setRules(fontRule: PadFitRule, inchRule: PadFitRule) {
        PadFitManger.fontRule = fontRule
        PadFitManger.inchRule = inchRule
    }
    
    private static func fitRule(originalValue: Double, rule: PadFitRule) -> Double {
        let ratio = rule.ratio
        switch rule.matchableState {
        case .wRatio:
            return Double(ratio.wRatio) * originalValue
        case .hRatio:
            return Double(ratio.hRatio) * originalValue
        case .minRatio:
            return Double(min(ratio.wRatio, ratio.hRatio)) * originalValue
        case .maxRatio:
            return Double(max(ratio.wRatio, ratio.hRatio)) * originalValue
        default:
            return Double(min(ratio.wRatio, ratio.hRatio)) * originalValue
        }
        
    }
    
    /// 整体适配 width, height 基于各自比率
    private static func fitFullRule(originalValue: Double, rule: PadFitRule, isWidth: Bool) -> Double {
        let ratio = rule.ratio
        if case .fullRatio  = rule.matchableState {
            if isWidth {
                return Double(ratio.wRatio) * originalValue
            } else {
                return Double(ratio.hRatio) * originalValue
            }
        }
        return originalValue
    }
}

extension PadFitManger {
    
    static func fitInch(_ original: Double) -> Double {
        return fitRule(originalValue: original, rule: inchRule)
        
    }
    
    static func fitFont(_ original: Double) -> Double {
        return fitRule(originalValue: original, rule: fontRule)
    }
    
    static func fitWRatio(_ original: Double) -> Double {
        return fitFullRule(originalValue: original, rule: inchRule, isWidth: true)
    }
    
    static func fitHRatio(_ original: Double) -> Double {
        return fitFullRule(originalValue: original, rule: inchRule, isWidth: false)
    }
}

