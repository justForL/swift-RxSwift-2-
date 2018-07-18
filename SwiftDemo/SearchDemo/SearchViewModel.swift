//
//  SearchViewModel.swift
//  SwiftDemo
//
//  Created by 冷健 on 2018/7/18.
//  Copyright © 2018年 james. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/// ViewModel输入流协议
protocol SearchViewModelInputProtocol {
    var searchText: PublishSubject<String> {get}
    var searchBtnTap: PublishSubject<Void> {get}
}

/// ViewModel输出流协议
protocol SearchViewModelOutputProtocol {
    var data: Driver<[Int]> {get}
}

/// ViewModel总的协议
protocol SearchViewModelProtocol {
    var input: SearchViewModelInputProtocol {get}
    var output: SearchViewModelOutputProtocol {get}
}

/// 遵守协议,继承属性
class SearchViewModel: SearchViewModelProtocol,SearchViewModelInputProtocol,SearchViewModelOutputProtocol {
    
    init() {
        
        //初始化属性  否则不能使用
        self.searchBtnTap = PublishSubject<Void>()
        self.searchText =  PublishSubject<String>()
        
        // 绑定
        self.data = self.searchBtnTap.asDriver(onErrorJustReturn: ())
            .flatMapLatest{ searchText in
                return Observable.from([1,2,3,4,5,6]).toArray().asDriver(onErrorJustReturn: []).delay(2);  //模拟网络请求
        }
        
        self.data = self.searchText.asDriver(onErrorJustReturn: "请重新输入")
            .flatMapLatest{ searchText in
                return Observable.from([1,2,3,4,5,6]).toArray().asDriver(onErrorJustReturn: []).delay(2);  //模拟网络请求
        }
    }
    
    
    // 从协议中继承来的属性
    var searchText: PublishSubject<String>
    
    var searchBtnTap: PublishSubject<Void>
    
    var data: Driver<[Int]>
    
    var input: SearchViewModelInputProtocol {return self}
    
    var output: SearchViewModelOutputProtocol {return self}
}
