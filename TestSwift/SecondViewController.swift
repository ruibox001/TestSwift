//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2017年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class SecondViewController: BaseViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTitle(title:"查找")
        
        self.addRight(anyObject: "Sheet" as AnyObject, block: { (v: UIView) in
            Sheet().setMsg("这里是详情").setTitle("标题").addAction(name: "确定", style: UIAlertActionStyle.default, click: { (action: UIAlertAction) in
                print("click \(String(describing: action.title))")
            }).addAction(name: "取消", style: UIAlertActionStyle.default, click: { (action: UIAlertAction) in
                print("click \(String(describing: action.title))")
            }).show()
        })
        
        self.addLeft(anyObject: "WKWebView" as AnyObject) { (v: UIView) in
            self.navigationController?.pushViewController(WKWebViewController(), animated: true)
        }
        
    }
    
}
