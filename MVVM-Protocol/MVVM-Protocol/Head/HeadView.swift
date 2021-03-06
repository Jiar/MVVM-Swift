//
//  HeadView.swift
//  MVVM-Protocol
//
//  Created by Jiar on 16/12/16.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class HeadView: UIView {

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.textColor = .lightGray
        detailLabel.font = UIFont.systemFont(ofSize: 13)
        detailLabel.textAlignment = .center
        return detailLabel
    }()
    
    var headViewModel: HeadViewProtocol? {
        didSet{
            headViewModel?.updataTitleData(titleLabel)
            headViewModel?.updataDetailLableData(detailLabel)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config(frame)
    }
    
    private func config(_ frame: CGRect) {
        backgroundColor = .white
        let width = frame.size.width
        let height = frame.size.height
        titleLabel.frame = CGRect(origin: CGPoint(x: 0, y: height/3), size: CGSize(width: width, height: height/5))
        detailLabel.frame = CGRect(origin: CGPoint(x: 0, y: height*2/3), size: CGSize(width: width, height: height/5))
        addSubview(titleLabel)
        addSubview(detailLabel)
    }

}
