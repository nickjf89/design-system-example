//
//  DesignSystem.swift
//  
//
//  Created by Nick Farrant on 17/01/2022.
//

import UIKit

public final class DesignSystem {
  public static let shared = DesignSystem(model: Bundle.main.makeDesignSystemModelFromFile())

  internal let model: DesignSystemModel
  init(model: DesignSystemModel) {
    self.model = model
  }
}
