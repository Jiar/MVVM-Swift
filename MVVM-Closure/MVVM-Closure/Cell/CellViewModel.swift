//
//  CellViewModel.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

class CellViewModel {
    
    let titleObservable: Observable<String?>
    let detailObservable: Observable<String?>
    let imageObservable: Observable<String?>
    
    init(_ cellModel: CellModel) {
        titleObservable = Observable(cellModel.title)
        detailObservable = Observable(cellModel.detail)
        imageObservable = Observable(cellModel.image)
    }
    
}
