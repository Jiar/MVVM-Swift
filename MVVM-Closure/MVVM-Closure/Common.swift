//
//  Common.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

let ScreenSize = UIScreen.main.bounds.size
let ScreenWidth = ScreenSize.width
let ScreenHeight = ScreenSize.height

let StatusHeight = UIApplication.shared.statusBarFrame.height
let NavigationHeight: CGFloat = 44
let TableViewCellHeight: CGFloat = 44

let MaxWidth = ScreenWidth
let MaxHeight = StatusHeight+NavigationHeight+ScreenHeight
let MaxSize = CGSize(width: MaxWidth, height: MaxHeight)

