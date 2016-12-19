//
//  ViewController.swift
//  MVVM-Protocol
//
//  Created by Jiar on 16/12/16.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var headView: HeadView!
    let HeadViewHeight: CGFloat = 88
    
    lazy var viewModel = ViewModel()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initHeadView()
        initTableView()
        refresh()
    }
    
    private func initTableView() {
        tableView = UITableView(frame: CGRect(origin: .zero, size: ScreenSize), style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.refreshControl = refreshControl
    }
    
    private func initHeadView() {
        headView = HeadView(frame: CGRect(origin: .zero, size: CGSize(width: MaxWidth, height: HeadViewHeight)))
    }
    
    func refresh() {
        viewModel.pageIndex = 0
        viewModel.pageSize = 10
        viewModel.refresh {
            [unowned self] in
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat = "HH:mm:ss"
            self.refreshControl.attributedTitle = NSAttributedString(string:"上次刷新时间：\(dateFormatter.string(from: currentDate))")
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func loadMore() {
        viewModel.pageIndex += 1
        viewModel.loadMore {
            [unowned self] in
            let pageIndex = self.viewModel.pageIndex
            let pageSize = self.viewModel.pageSize
            let from = pageIndex*pageSize
            var indexPaths: [IndexPath] = []
            for index in from ..< from+pageSize {
                indexPaths.append(IndexPath(row: index, section: 0))
            }
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: indexPaths, with: .fade)
            self.tableView.endUpdates()
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewCellHeight*1.8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeadViewHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headView.headViewModel = viewModel.headViewModel
        return headView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell.getCustomCell(tableView: tableView)
        cell.cellViewModel = viewModel.cellViewModels[indexPath.row]
        return cell
    }
    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let indexPath = tableView.indexPathsForVisibleRows?.last else {
            return
        }
        if indexPath.row >= viewModel.cellViewModels.count-2 {
            loadMore()
        }
    }
    
}


