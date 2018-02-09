//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2017年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class FirstViewController: BaseViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTitle(title:"首页")
        
        self.addRight(anyObject: ["Alert","评论","跳转"] as AnyObject, block: { (v: UIView) in
            if v.tag == 0 {
            
                Alert().setMsg("这里是详情").setTitle("标题").addAction(name: "取消", style: UIAlertActionStyle.default, click: { (action: UIAlertAction) in
                    Dlog("click \(String(describing: action.title))")
                }).addAction(name: "确定", style: UIAlertActionStyle.default, click: { (action: UIAlertAction) in
                    print("click \(String(describing: action.title))")
                })
                .show()
            }
            else if v.tag == 1{
                Alert().setMsg("这里未做任何事").addAction(name: "确定", style: UIAlertActionStyle.default, click: nil).show()
            }
            else {
                self.navigationController?.pushViewController(TestViewController(), animated: true)
            }
        })
        
        let lab = Label().labelFont(fnt(15)).labelText("Hello world 我们是中国人").labelShadow(color("random"), CGSize.init(width: 100, height: 50)).labelAlign(NSTextAlignment.center)
        lab.frame = CGRect.init(x: 10, y: 100, width: phoneWidth-20, height: 50)
        self.view.addSubview(lab)
        
        let image = imageWithName("xxx")?.imageScaleWithSize(CGSize.init(width: 50, height: 50))
        let img = ImageView().imgViewWithImage(image: image!)
        img.frame = CGRect.init(x: (phoneWidth-(image?.imageSize().width)!)*0.5, y: 200, width: (image?.imageSize().width)!, height: (image?.imageSize().height)!)
        self.view.addSubview(img)
        
        _ = View().viewFrame(CGRect.init(x: 100, y: 400, width: phoneWidth-200, height: 50)).viewBgColor(UIColor.orange).viewIntoView(self.view).viewScale(makePoint(0.5, 0.5), animation:5)
        
        
        //分段选项显示
        let items = ["见哥1","见哥2",UIImage(named:"back")!] as [Any]
        
        //初始化对象
        let segmentedControl = UISegmentedControl(items:items)
        
        //设置位置
        segmentedControl.center = self.view.center
        
        //当前选中下标
        segmentedControl.selectedSegmentIndex = 1
        
        //添加事件
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: UIControlEvents.valueChanged)
        
        //添加
        self.view.addSubview(segmentedControl)
        
        DoInConcurrent {
            Dlog("子线程并发: \(Thread.current)")
        }
        
        DoInConcurrent {
            Dlog("子线程串行 \(Thread.current)")
        }
        
        DoInMain {
            Dlog("主线程执行 \(Thread.current)")
        }
        
        DoInMainAfter(3) {
            Dlog("延迟3秒后主线程执行 \(Thread.current)")
        }
        
    }
    
    @objc func clickView() {
        Dlog("click view \(self.classForCoder)")
    }
    
    //选择点击后的事件
    @objc func segmentedControlChanged(sender:UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
}
