//
//  Model.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

struct Model {
    
    var pageIndex: Int = 0
    var pageSize: Int = 10
    let headModel: HeadModel
    let cellModels: [CellModel]
    
}
