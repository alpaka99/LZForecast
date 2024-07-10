//
//  Observable.swift
//  LZForecast
//
//  Created by user on 7/10/24.
//

import Foundation

final class Observable<T> {
    internal var value: T {
        didSet {
            closure?(value)
        }
    }
    
    private var closure: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    internal func actionBind(_ closure: @escaping (T)->Void) {
        closure(value)
        self.closure = closure
    }
    
    internal func bind(_ closure: @escaping (T)->Void) {
        self.closure = closure
    }
}
