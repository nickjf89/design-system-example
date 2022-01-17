//
//  TPColor.swift
//  
//
//  Created by Nick Farrant on 17/01/2022.
//

import UIKit

public struct TPColor: Codable, DesignSystemIdentifiable {
  public struct Variant: Codable {
    public enum Identifier: String, Codable {
      case light, dark
    }

    let identifier: Identifier
    let components: Components?
    let hex: String?
  }

  public struct Components: Codable {
    let red: CGFloat?
    let green: CGFloat?
    let blue: CGFloat?
    let alpha: CGFloat?
  }

  public let identifier: String
  let variants: [Variant]?
}

public extension TPColor {
  enum Identifier: String {
    case brand
  }
}
