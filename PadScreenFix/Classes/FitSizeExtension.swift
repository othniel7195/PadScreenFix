//
//  FitSizeExtension.swift
//  PadScreenFix
//
//  Created by jimmy on 2021/9/14.
//

import Foundation


public protocol FitProtocol {
    
    associatedtype `Type`
    
    var fitInch: Type { get }
    var fitFont: CGFloat { get }
    var fitWRatio: Type { get }
    var fitHRatio: Type { get }
}


extension Double: FitProtocol {
    public typealias `Type` = Double
    
    public var fitInch: Double {
        return PadFitManger.fitInch(self)
    }
    
    public var fitFont: CGFloat {
        return CGFloat(PadFitManger.fitFont(self))
    }
    
    public var fitWRatio: Double {
        return PadFitManger.fitWRatio(self)
    }
    
    public var fitHRatio: Double {
        return PadFitManger.fitHRatio(self)
    }
}

extension Double: MatchableProtocol {}


extension CGFloat: FitProtocol {
    public typealias `Type` = CGFloat
    
    public var fitInch: CGFloat {
        return CGFloat(PadFitManger.fitInch(Double(self)))
    }
    
    public var fitFont: CGFloat {
        return CGFloat(PadFitManger.fitFont(Double(self)))
    }
    
    public var fitWRatio: CGFloat {
        return CGFloat(PadFitManger.fitWRatio(Double(self)))
    }
    
    public var fitHRatio: CGFloat {
        return CGFloat(PadFitManger.fitHRatio(Double(self)))
    }
}

extension CGFloat: MatchableProtocol {}

extension Float: FitProtocol {
    
    public typealias `Type` = Float
    
    public var fitInch: Float {
        return Float(PadFitManger.fitInch(Double(self)))
    }
    
    public var fitFont: CGFloat {
        return CGFloat(Float(PadFitManger.fitFont(Double(self))))
    }
    
    public var fitWRatio: Float {
        return Float(PadFitManger.fitWRatio(Double(self)))
    }
    
    public var fitHRatio: Float {
        return Float(PadFitManger.fitHRatio(Double(self)))
    }
}

extension Float: MatchableProtocol {}

extension Int: FitProtocol {
    public typealias `Type` = Int
    
    public var fitInch: Int {
        return Int(PadFitManger.fitInch(Double(self)))
    }
    
    public var fitFont: CGFloat {
        return CGFloat(Int(PadFitManger.fitFont(Double(self))))
    }
    
    public var fitWRatio: Int {
        return Int(PadFitManger.fitWRatio(Double(self)))
    }
    
    public var fitHRatio: Int {
        return Int(PadFitManger.fitHRatio(Double(self)))
    }
}

extension Int: MatchableProtocol {}


extension BinaryFloatingPoint {
    public func fitInch<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.fitInch)
    }
    
    public func fitFont<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.fitFont)
    }
}

extension BinaryInteger {
    public func fitInch<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.fitInch)
    }
    
    public func fitFont<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.fitFont)
    }
}
