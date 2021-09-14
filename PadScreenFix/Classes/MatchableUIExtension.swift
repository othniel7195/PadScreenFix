//
//  MatchableUIExtension.swift
//  PadScreenFix
//
//  Created by jimmy on 2021/9/14.
//

import Foundation

extension UILabel {
    
    func fitFont() -> Self {
        font = UIFont(name: font.fontName, size: font.pointSize.fitFont)
        return self
    }
}
