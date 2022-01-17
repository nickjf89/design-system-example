//
//  DesignSystem.swift
//  
//
//  Created by Nick Farrant on 17/01/2022.
//

import UIKit

public protocol DesignSystemIdentifiable {
  var identifier: String { get }
}


public final class DesignSystem {
  public static let shared = DesignSystem(model: Bundle.main.makeDesignSystemModelFromFile())

  internal let model: DesignSystemModel
  init(model: DesignSystemModel) {
    self.model = model
  }
}
