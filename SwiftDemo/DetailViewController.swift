//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by 冷健 on 2018/7/11.
//  Copyright © 2018年 james. All rights reserved.
//

import UIKit

typealias returnClosure = ()->Void;

class DetailViewController: UIViewController {
    
    var finished: returnClosure?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(jumpButton);
    }
    
    @objc func btnClick(sender:UIButton) -> Void {
        print("123");
    }

    fileprivate lazy var jumpButton = { () -> UIButton in
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        btn.backgroundColor = UIColor.red;
        btn.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        btn.center = self.view.center;
        return btn;
    }()
}
