//
//  ColorExtension.swift
//  
//
//  Created by Nick Farrant on 17/01/2022.
//

import UIKit
import SwiftUI

public extension UIColor {
  static func colorWithDesignId(_ identifier: TPColor.Identifier) -> UIColor? {
    return DesignSystem.shared.color(withIdentifier: identifier)
  }

  static func colorWithDesignId(_ identifier: TPColor.Identifier, withOverride override: UIColor) -> UIColor {
    return DesignSystem.shared.color(withIdentifier: identifier) ?? override
  }
}

public extension Color {
  static func colorWithDesignId(_ identifier: TPColor.Identifier) -> Color? {
    guard let uiColor = UIColor.colorWithDesignId(identifier) else { return nil }
    return Color(uiColor: uiColor)
  }

  static func colorWithDesignId(_ identifier: TPColor.Identifier, withOverride override: Color) -> Color {
    if let uiColor = UIColor.colorWithDesignId(identifier) {
      return Color(uiColor: uiColor)
    } else {
      return override
    }
  }
}

private extension DesignSystem {
  func color(withIdentifier identifier: TPColor.Identifier) -> UIColor? {
    guard let tpColor = model.colors?.first(where: { $0.identifier == identifier.rawValue }) else { return nil }
    guard let components = tpColor.components,
          let red = components.red,
          let green = components.green,
          let blue = components.blue,
          let alpha = components.alpha
    else { return nil }

    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
  }
}
