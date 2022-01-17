//
//  File.swift
//  
//
//  Created by Nick Farrant on 17/01/2022.
//

import Foundation

public extension Bundle {
  func makeDesignSystemModelFromFile() -> DesignSystemModel {
    guard let path = Bundle.module.path(forResource: "designsystem", ofType: "json") else {
      fatalError("Could not get designsystem.json file from main bundle")
    }

    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
      let decoder = JSONDecoder()
      let json = try decoder.decode(DesignSystemModel.self, from: data)
      return json
    } catch {
      print(error.localizedDescription)
      print(String(describing: error))
      fatalError("Could not build model")
    }
  }
}
