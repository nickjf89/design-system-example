//
//  TPColor.swift
//  
//
//  Created by Nick Farrant on 17/01/2022.
//

import UIKit

public struct TPColor: Codable, DesignSystemIdentifiable {
  public enum Identifier: String {
    case brand
  }

  public enum Theme: String, Codable {
    case light, dark
  }

  public struct Components: Codable {
    let red: CGFloat?
    let green: CGFloat?
    let blue: CGFloat?
    let alpha: CGFloat?
  }

  public let identifier: String
  let components: Components?
  let hex: String?
  let theme: Theme?
}
