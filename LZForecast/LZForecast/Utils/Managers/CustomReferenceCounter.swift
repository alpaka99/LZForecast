//
//  CustomReferenceCounter.swift
//  LZForecast
//
//  Created by user on 7/17/24.
//

import Foundation

final class CustomReferenceCounter {
    static let shared = CustomReferenceCounter()
    private var referenceCounter: [String : Int] = [:]
    
    init() {
        increment(name: String(describing: type(of: self)))
    }
    
    func increment(name: String) {
        if referenceCounter[name] != nil {
            referenceCounter[name]! += 1
            print("Init from \(name): referenceCount: \(referenceCounter[name])")
        } else {
            referenceCounter[name] = 1
            print("Init from \(name): referenceCount: \(referenceCounter[name])")
        }
        
//        dump(referenceCounter)
    }
    
    func decrement(name: String) {
        if referenceCounter[name] != nil {
            referenceCounter[name]! -= 1
            print("Deinit from \(name): referenceCount: \(referenceCounter[name])")
        } else {
//            dump(referenceCounter)
            print("Error from \(name): referenceCount: \(referenceCounter[name])")
            fatalError("Decrementing None Existing Object Count Error")
        }
        
//        dump(referenceCounter)
    }
    
    deinit {
        decrement(name:  String(describing: type(of: self)))
        print(referenceCounter)
    }
}
