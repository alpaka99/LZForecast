//
//  NSObject+Extension.swift
//  LZForecast
//
//  Created by user on 7/17/24.
//

import Foundation

extension NSObject {
    var objectName: String {
        return String(describing: type(of: self))
    }
}
