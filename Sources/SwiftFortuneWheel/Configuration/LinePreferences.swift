//
//  LinePreferences.swift
//  SwiftFortuneWheel
//
//  Created by Sherzod Khashimov on 6/17/20.
//

import Foundation

#if os(macOS)
import AppKit
#else
import UIKit
#endif

/// Line Preferences
public struct LinePreferences {
    
    /// Stroke width
    public var height: CGFloat = 1
    
    /// Stroke color type
    public var colorType: SFWConfiguration.ColorType
    
    /// Vertical offset in slice from the center
    public var verticalOffset: CGFloat
    
    /// Initiates a line preferences
    /// - Parameters:
    ///   - height: Line height, default value is `1`
    ///   - colorType: Line color type
    ///   - verticalOffset: Line vertical offset, default value is `0`
    public init(colorType: SFWConfiguration.ColorType,
                height: CGFloat = 1,
                verticalOffset: CGFloat = 0) {
        self.height = height
        self.colorType = colorType
        self.verticalOffset = verticalOffset
    }
}

extension LinePreferences {
    func strokeColor(for index: Int) -> SFWColor {
        var strokeColor = SFWColor.clear
        
        switch self.colorType {
        case .evenOddColors(let evenColor, let oddColor):
            strokeColor = index % 2 == 0 ? evenColor : oddColor
        case .customPatternColors(let colors, let defaultColor):
            strokeColor = colors?[index, default: defaultColor] ?? defaultColor
        }
        return strokeColor
    }
}
