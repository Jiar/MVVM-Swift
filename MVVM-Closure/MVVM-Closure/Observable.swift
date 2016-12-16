//
//  Observable.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

class Observable<T> {
    
    typealias Observer = (T) -> Void
    
    private var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func observer(_ observer: Observer?){
        self.observer = observer
        observer?(value)
    }
    
}
