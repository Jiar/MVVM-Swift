//
//  CustomPresentable.swift
//  MVVM-Protocol
//
//  Created by Jiar on 16/12/16.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

protocol TitlePresentable {
    
    var title: String {get}
    var titleColor: UIColor {get}
    
    func updataTitleData(_ titleLable: UILabel)
    
}

extension TitlePresentable {
    
    var titleColor: UIColor {
        return .darkGray
    }
    
    func updataTitleData(_ titleLable: UILabel) {
        titleLable.text = title
        titleLable.textColor = titleColor
    }
    
}

protocol DetailPresentable {
    
    var detail: String {get}
    var detailColor: UIColor {get}
    
    func updataDetailLableData(_ detailLable: UILabel)
    
}

extension DetailPresentable {
    
    var detailColor: UIColor {
        return .lightGray
    }
    
    func updataDetailLableData(_ detailLable: UILabel) {
        detailLable.text = detail
        detailLable.textColor = detailColor
    }
    
}

protocol ImagePresentable {
    
    var image: String {get}
    
    func updataImageViewData(_ imageView: UIImageView)
    
}

extension ImagePresentable {
    
    func updataImageViewData(_ imageView: UIImageView) {
        imageView.image = UIImage(named: image)
    }
    
}
