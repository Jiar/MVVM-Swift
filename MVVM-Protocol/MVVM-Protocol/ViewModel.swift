//
//  ViewModel.swift
//  MVVM-Protocol
//
//  Created by Jiar on 16/12/19.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import Foundation

class ViewModel {
    
    var pageIndex: Int = 0
    var pageSize: Int = 10
    var headViewModel: HeadViewModel?
    var cellViewModels: [CellViewModel] = []
    
    func refresh(completion: @escaping ()->Void) {
        requestData(withPageIndex: pageIndex, pageSize: pageSize) {
            (model) in
            self.headViewModel = HeadViewModel(model.headModel)
            self.cellViewModels = model.cellModels.map {
                return CellViewModel($0)
            }
            completion()
        }
    }
    
    func loadMore(completion: @escaping ()->Void) {
        requestData(withPageIndex: pageIndex, pageSize: pageSize) {
            (model) in
            let cellViewModels = model.cellModels.map {
                return CellViewModel($0)
            }
            self.cellViewModels.append(contentsOf: cellViewModels)
            completion()
        }
    }
    
    private func requestData(withPageIndex pageIndex: Int, pageSize: Int = 10, completion: @escaping (Model)->Void) {
        RequestHelper.request(withPageIndex: pageIndex, pageSize: pageSize, completion: { (array, dictory) in
            let headModel = HeadModel(title: dictory["title"] ?? "", detail: dictory["detail"] ?? "")
            let cellModels = array.map {
                return CellModel(title: $0["title"] ?? "", detail: $0["detail"] ?? "", image: $0["image"] ?? "")
            }
            let model = Model(headModel: headModel, cellModels: cellModels)
            completion(model)
        })
    }
    
}

class RequestHelper {
    
    static let ConcurrentQueue = DispatchQueue(label: "com.jiar.concurrent", attributes: .concurrent)
    
    class func request(withPageIndex pageIndex: Int, pageSize: Int, completion: @escaping ([[String: String]], [String: String])->Void) {
        
        ConcurrentQueue.async {
            var array: [[String: String]] = []
            let from = pageIndex*pageSize
            for index in from ..< from+pageSize {
                array.append(["image":"Ninja0\(index%8+1)","title":"Ninja \(index)","detail":"this is the Ninja \(index)"])
            }
            let dictory: [String: String] = ["title": "Teenage Mutant Ninja Turtles", "detail": "arc4random：\(arc4random())"]
            DispatchQueue.main.sync {
                completion(array, dictory)
            }
        }
        
    }
    
}
