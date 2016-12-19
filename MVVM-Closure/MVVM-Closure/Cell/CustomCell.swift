//
//  CustomCell.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var cellViewModel: CellViewModel? {
        didSet {
            cellViewModel?.titleObservable.observer {
                [unowned self] in
                self.textLabel?.text = $0
                self.textLabel?.textColor = .darkGray
            }
            cellViewModel?.detailObservable.observer {
                [unowned self] in
                self.detailTextLabel?.text = $0
                self.detailTextLabel?.textColor = .lightGray
            }
            cellViewModel?.imageObservable.observer {
                [unowned self] in
                if let image = $0 {
                    self.imageView?.image = UIImage(named: image)
                } else {
                    self.imageView?.image = nil
                }
            }
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
