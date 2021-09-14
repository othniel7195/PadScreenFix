//
//  PadFitRule.swift
//  PadScreenFix
//
//  Created by jimmy on 2021/9/14.
//

import Foundation

public class PadFitRule {
    
    let uiScreen: PadScreenFitConfig.Screen
    let numberLines: Int
    /// width 比率, height 比率
    let ratio: (wRatio: CGFloat, hRatio: CGFloat)
    
    let matchableState: MatchableScreenState
    
    public enum MatchableScreenState {
// 基于width 比率适配
        case wRatio
// 基于height 比率适配
        case hRatio
// 基于width, height 中最小比率适配
        case minRatio
// 基于width, height 中最大比率适配
        case maxRatio
// width, height 基于各自的比率适配
        case fullRatio
    }
    
    /// 设置适配规则
    /// - Parameters:
    ///   - uiScreen: UI设计师设计用的分辨率
    ///   - ratio: 适配比率  nil 就用默认比率
    ///   - numberLines: 默认换行
    ///   - matchState: 适配机制 默认基于width 比率适配
    public init(_ uiScreen: PadScreenFitConfig.Screen,
         ratio: (CGFloat, CGFloat)? = nil,
         numberLines: Int = 0,
         matchableState: MatchableScreenState = .wRatio) {
        self.uiScreen = uiScreen
        self.numberLines = numberLines
        self.matchableState = matchableState
        
        if let r = ratio {
            self.ratio = r
        } else {
            let current = PadScreenFitConfig.current
            let wRatio = current.nativeSize.width / uiScreen.nativeSize.width
            let hRatio = current.nativeSize.height / uiScreen.nativeSize.height
            self.ratio = (wRatio, hRatio)
        }
    }
    
    
    static let `default` = PadFitRule(PadScreenFitConfig.uiTemplate)
}

