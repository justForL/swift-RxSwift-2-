//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 冷健 on 2018/7/10.
//  Copyright © 2018年 james. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        let detail = DetailViewController();
//        detail.finished = { ()->Void in
//            print("ok");
//        }
//        navigationController?.pushViewController(detail, animated: true);
        
        navigationController?.pushViewController(SearchViewController(), animated: true);
    }

}

