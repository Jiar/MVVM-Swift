//
//  ViewModel.swift
//  MVVM-Closure
//
//  Created by Jiar on 16/12/15.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import Foundation

class ViewModel {
    
    let pageIndexObservable: Observable<Int?>
    let pageSizeObservable: Observable<Int?>
    let headViewModelObservable: Observable<HeadViewModel?>
    let cellViewModelsObservable: Observable<[CellViewModel]>
    
    init() {
        pageIndexObservable = Observable(nil)
        pageSizeObservable = Observable(nil)
        headViewModelObservable = Observable(nil)
        cellViewModelsObservable = Observable([])
    }
    
    func refresh(completion: @escaping ()->Void) {
        requestData(withPageIndex: pageIndexObservable.value ?? 0, pageSize: pageSizeObservable.value ?? 0) {
            (model) in
            self.headViewModelObservable.value = HeadViewModel(model.headModel)
            self.cellViewModelsObservable.value = model.cellModels.map {
                return CellViewModel($0)
            }
            completion()
        }
    }
    
    func loadMore(completion: @escaping ()->Void) {
        requestData(withPageIndex: pageIndexObservable.value ?? 0, pageSize: pageSizeObservable.value ?? 0) {
            (model) in
            let cellViewModels = model.cellModels.map {
                return CellViewModel($0)
            }
            self.cellViewModelsObservable.value.append(contentsOf: cellViewModels)
            completion()
        }
    }
    
    private func requestData(withPageIndex pageIndex: Int, pageSize: Int = 10, completion: @escaping (Model)->Void) {
        RequestHelper.PageIndex = pageIndex
        RequestHelper.PageSize = pageSize
        RequestHelper.request { (array, dictory) in
            let headModel = HeadModel(title: dictory["title"] ?? "", detail: dictory["detail"] ?? "")
            let cellModels = array.map {
                return CellModel(image: $0["image"] ?? "", title: $0["title"] ?? "", detail: $0["detail"] ?? "")
            }
            let model = Model(pageIndex: pageIndex, pageSize: pageSize, headModel: headModel, cellModels: cellModels)
            completion(model)
        }
    }
    
}

class RequestHelper {
    
    static var PageIndex = 0
    static var PageSize = 10
    static let ConcurrentQueue = DispatchQueue(label: "com.jiar.concurrent", attributes: .concurrent)
    
    class func request(completion: @escaping ([[String: String]], [String: String])->Void) {
        
        ConcurrentQueue.async {
            var array: [[String: String]] = []
            let from = PageIndex*PageSize
            for index in from ..< from+PageSize {
                array.append(["image":"Ninja0\(index%8+1)","title":"Ninja \(index)","detail":"this is the Ninja \(index)"])
            }
            let dictory: [String: String] = ["title": "Teenage Mutant Ninja Turtles", "detail": "arc4random：\(arc4random())"]
            DispatchQueue.main.sync {
                completion(array, dictory)
            }
        }
        
    }
    
}
