//
//  PadScreenFitConfig.swift
//  PadScreenFix
//
//  Created by jimmy on 2021/9/13.
//

import Foundation
import UIKit

public struct PadScreenFitConfig {
//    默认横屏
    public static var isLandscape: Bool = true
    
    public enum Screen: Equatable {
//        基于真实的分辨率  假设 scale 1x
        case custom(width: CGFloat, height: CGFloat)
// mini, 9.7-inch, air2  768 * 1024  2x
        case p97
//  10.2-inch  810x1080  2x
        case p102
// 10.5-inch air 834x1112 2x
        case p105
// 10.5-inch Pro, 11-inch  834x1194  2x
        case p11
// air4 1180 * 820
        case p119
// mini6 1133 * 744
        case mini6
//  12.9-inch 1024x1366  2x
        case p129
        
//       https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/
        var size: CGSize {
            switch self {
            case .custom(let width, let height):
                return CGSize(width: width, height: height).isLandscape(PadScreenFitConfig.isLandscape)
            case .p97:
                return CGSize(width: 768, height: 1024).isLandscape(PadScreenFitConfig.isLandscape)
            case .p102:
                return CGSize(width: 810, height: 1080).isLandscape(PadScreenFitConfig.isLandscape)
            case .p105:
                return CGSize(width: 834, height: 1112).isLandscape(PadScreenFitConfig.isLandscape)
            case .p11:
                return CGSize(width: 834, height: 1194).isLandscape(PadScreenFitConfig.isLandscape)
            case .p129:
                return CGSize(width: 1024, height: 1366).isLandscape(PadScreenFitConfig.isLandscape)
            case .p119:
                return CGSize(width: 820, height: 1180).isLandscape(PadScreenFitConfig.isLandscape)
            case .mini6:
                return CGSize(width: 744, height: 1133).isLandscape(PadScreenFitConfig.isLandscape)
            }
        }
        
        var scale: CGFloat {
            switch self {
            case .custom:
                return 1
            default:
                return 2
            }
        }
        
        public var nativeSize: CGSize {
            return CGSize(width: size.width * scale, height: size.height * scale)
        }
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            if lhs.nativeSize.width == rhs.nativeSize.width && lhs.nativeSize.height == rhs.nativeSize.height {
                return true
            }
            return false
        }
        
    }
    
    internal static let current: Screen = {
        let width = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        let height = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        let scale = UIScreen.main.scale
        let size = CGSize(width: width, height: height).isLandscape(PadScreenFitConfig.isLandscape)
        
        if size == Screen.p97.size {
            return .p97
        }
        
        let nativeSize = CGSize(width: width * scale, height: height * scale).isLandscape(PadScreenFitConfig.isLandscape)
        
        switch nativeSize {
        case Screen.p97.nativeSize:
            return .p97
        case Screen.p102.nativeSize:
            return .p102
        case Screen.p105.nativeSize:
            return .p105
        case Screen.p11.nativeSize:
            return .p11
        case Screen.p129.nativeSize:
            return .p129
        case Screen.p119.nativeSize:
            return .p119
        case Screen.mini6.nativeSize:
            return .mini6
        default:
            return uiTemplate
        }
    }()
    
    public static var uiTemplate: Screen = .custom(width: 1920, height: 1080)
    
}


extension CGSize {
    
    var landscape: CGSize {
        let width = max(width, height)
        let height = min(width, height)
        return CGSize(width: width, height: height)
    }
    
    var portrait: CGSize {
        let width = min(width, height)
        let height = max(width, height)
        return CGSize(width: width, height: height)
    }
    
    func isLandscape(_ isLandscape: Bool) -> CGSize {
        if isLandscape {
            return landscape
        }
        return portrait
    }
}
