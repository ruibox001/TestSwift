//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2017年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit
import WebKit

public class TestWKWebViewController: BaseViewController, WKNavigationDelegate,WKUIDelegate {
    
    var webView: WKWebView?
    
    private lazy var userController: WKUserContentController = {
        let u: WKUserContentController = WKUserContentController()
        return u
    }()
    
    //Js调用原生注册手柄
    public lazy var jsController: JsMethodControl = {
        let jsController: JsMethodControl = JsMethodControl(self.userController)
        return jsController
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTitle(title: "WKWebView")
        self.addLeft(anyObject: nil, block: nil)
        
        let config: WKWebViewConfiguration = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.userContentController = self.userController
        
        self.webView = WKWeb(self.view.bounds, config)
            .wkWebDelegate(self)
            .wkWebNaviDelegate(self)
            .wkWebLoadUrlStr("https://www.baidu.com")
            .viewIntoView(self.view) as? WKWebView
        
        
    }
    
    
    
}
