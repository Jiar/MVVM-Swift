//
//  CellViewModel.swift
//  MVVM-Protocol
//
//  Created by Jiar on 16/12/16.
//  Copyright © 2016年 Jiar. All rights reserved.
//

protocol CustomCellProtocol: TitlePresentable, DetailPresentable, ImagePresentable{}

class CellViewModel: CustomCellProtocol {
    
    var title: String
    var detail: String
    var image: String
    
    init(_ model: CellModel) {
        self.title = model.title
        self.detail = model.detail
        self.image = model.image
    }
    
}
