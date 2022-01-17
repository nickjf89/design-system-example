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
  public static let shared = DesignSystem()
  internal let model: DesignSystemModel

  init() {
    model = DesignSystem.makeDesignSystemModelFromFile()
  }

  private static func makeDesignSystemModelFromFile() -> DesignSystemModel {
    guard let path = Bundle.module.path(forResource: "designsystem", ofType: "json") else {
      fatalError("Could not get designsystem.json file from main bundle")
    }

    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      return try JSONDecoder().decode(DesignSystemModel.self, from: data)
    } catch {
      fatalError("Could not decode design system json")
    }
  }
}
