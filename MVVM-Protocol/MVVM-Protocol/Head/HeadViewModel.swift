//
//  HeadViewModel.swift
//  MVVM-Protocol
//
//  Created by Jiar on 16/12/16.
//  Copyright © 2016年 Jiar. All rights reserved.
//

protocol HeadViewProtocol: TitlePresentable, DetailPresentable{}

class HeadViewModel: HeadViewProtocol {
    
    var title: String
    var detail: String
    
    init(_ model:HeadModel) {
        self.title = model.title
        self.detail = model.detail
    }
    
}
