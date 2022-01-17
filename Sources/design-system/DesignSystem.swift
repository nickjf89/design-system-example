//
//  DesignSystem.swift
//  
//
//  Created by Nick Farrant on 17/01/2022.
//

import UIKit

public final class DesignSystem {
  private var appBundle: Bundle?
  internal var model: DesignSystemModel!

  public static let shared = DesignSystem()

  public func setAppBundle(_ bundle: Bundle) {
    appBundle = bundle
    makeDesignSystemModel()
  }

  private func makeDesignSystemModel() {
    guard let appBundle = appBundle else {
      fatalError("App bundle not set. Please call DesignSystem.shared.setAppBundle(Bundle.module).")
    }
    
    guard let path = appBundle.path(forResource: "designsystem", ofType: "json") else {
      fatalError("Could not get designsystem.json file from main bundle")
    }

    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
      let decoder = JSONDecoder()
      let json = try decoder.decode(DesignSystemModel.self, from: data)
      model = json
    } catch {
      print(error.localizedDescription)
      print(String(describing: error))
      fatalError("Could not build model")
    }
  }
}
