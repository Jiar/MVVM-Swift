//
//  CellViewModel.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

class CellViewModel {
    
    let imageObservable: Observable<String?>
    let titleObservable: Observable<String?>
    let detailObservable: Observable<String?>
    
    init(_ cellModel: CellModel) {
        imageObservable = Observable(cellModel.image)
        titleObservable = Observable(cellModel.title)
        detailObservable = Observable(cellModel.detail)
    }
    
}
