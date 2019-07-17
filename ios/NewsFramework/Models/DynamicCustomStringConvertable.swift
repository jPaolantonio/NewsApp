//
//  DynamicCustomStringConvertable.swift
//  NewsFramework
//
//  Created by James Paolantonio on 7/15/19.
//  Copyright © 2019 J. All rights reserved.
//

import Foundation

extension CustomStringConvertible {
  var description : String {
    var description: String = "***** \(type(of: self)) *****\n"
    let selfMirror = Mirror(reflecting: self)
    for child in selfMirror.children {
      if let propertyName = child.label {
        description += "\(propertyName): \(child.value)\n"
      }
    }
    return description
  }
}
