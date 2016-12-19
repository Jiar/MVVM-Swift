//
//  CustomCell.swift
//  MVVM-Protocol
//
//  Created by Jiar on 16/12/16.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var cellViewModel: CustomCellProtocol? {
        didSet{
            cellViewModel?.updataTitleData(self.textLabel!)
            cellViewModel?.updataDetailLableData(self.detailTextLabel!)
            cellViewModel?.updataImageViewData(self.imageView!)
        }
    }
    
    class func getCustomCell(tableView:UITableView) -> CustomCell {
        let Identifiler = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiler) as? CustomCell
        guard let _ = cell else {
            return CustomCell(style: .subtitle, reuseIdentifier: Identifiler)
        }
        return cell!
    }
    
}
