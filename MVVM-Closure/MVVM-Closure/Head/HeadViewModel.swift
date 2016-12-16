//
//  HeadViewModel.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

class HeadViewModel {
    
    let titleObservable: Observable<String>
    let detailObservable: Observable<String>
    
    init(_ model: HeadModel) {
        titleObservable = Observable(model.title)
        detailObservable = Observable(model.detail)
    }
    
}
