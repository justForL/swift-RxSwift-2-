//
//  SearchViewController.swift
//  SwiftDemo
//
//  Created by 冷健 on 2018/7/18.
//  Copyright © 2018年 james. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
class SearchViewController: UIViewController {
    private let viewModel = SearchViewModel()
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        
        setUpUI();
        snapKitSubViews();
        bindRx();
    }
    
    func bindRx() -> Void {
        inputTF.rx.text.orEmpty
            .distinctUntilChanged()
            .bind(to: viewModel.input.searchText)
            .disposed(by: disposeBag);
    
        searchBtn.rx.tap
            .debug()
            .bind(to:viewModel.input.searchBtnTap)
            .disposed(by: disposeBag);
        
        viewModel.output.data.drive(onNext:{data in
            print(data);
        }).disposed(by: disposeBag)
        
    }
    
    func setUpUI() -> Void {
        view.backgroundColor = UIColor.white;
        view.addSubview(inputTF);
        view.addSubview(searchBtn);
    }
    
    func snapKitSubViews() -> Void {
        inputTF.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top);
            }else{
                make.top.equalTo(view.snp.top);
            }
            make.left.equalTo(view.snp.left).offset(10);
            make.right.equalTo(view.snp.right).offset(-10);
        }
        
        searchBtn.snp.makeConstraints { (make) in
            make.top.equalTo(inputTF.snp.bottom).offset(20);
            make.left.equalTo(inputTF.snp.left);
            make.right.equalTo(inputTF.snp.right);
            make.height.equalTo(45);
        }
    }
    
    ///LazyLoad
    
    fileprivate lazy var inputTF = {()-> UITextField in
        let label = UITextField();
        label.borderStyle = .line;
        return label;
    }()
    fileprivate lazy var searchBtn = {()-> UIButton in
        let btn = UIButton();
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.7286861539, blue: 0.9383053184, alpha: 1)
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = true;
        btn.setTitle("搜索", for: .normal)
        return btn;
    }()
    
    
}
