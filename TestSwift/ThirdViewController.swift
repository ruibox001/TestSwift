//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2017年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class ThirdViewController: BaseViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTitle(title:"相册")
        
        self.addRight(anyObject: "Alert" as AnyObject, block: { (v: UIView) in
            Alert().setMsg("这里是详情").setTitle("标题").addAction(name: "取消", style: UIAlertActionStyle.default, click: { (action: UIAlertAction) in
                Dlog("click \(String(describing: action.title))")
            }).addAction(name: "确定", style: UIAlertActionStyle.default, click: { (action: UIAlertAction) in
                print("click \(String(describing: action.title))")
            })
            .show()
        })
    }
}
