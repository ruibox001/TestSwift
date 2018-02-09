//
//  WKWebView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import JavaScriptCore

func WKWeb(_ rect: CGRect) -> WKWebView {
    return WKWebView(frame: rect)
}

func WKWeb(_ rect: CGRect, _ config: WKWebViewConfiguration) -> WKWebView {
    return WKWebView(frame: rect, configuration: config)
}

extension WKWebView
{
    
    func wkWebDelegate(_ uiDelegate: WKUIDelegate?) -> WKWebView {
        self.uiDelegate = uiDelegate
        return self
    }
    
    func wkWebNaviDelegate(_ navigationDelegate: WKNavigationDelegate?) -> WKWebView {
        self.navigationDelegate = navigationDelegate
        return self
    }
    
    func wkWebLoadHtmlString(_ htmlString: String) -> WKWebView {
        self.loadHTMLString(htmlString, baseURL: nil)
        return self
    }
    
    func wkWebLoadRequest(_ request: URLRequest) -> WKWebView {
        self.load(request)
        return self
    }
    
    func wkWebLoadUrlStr(_ url: String) -> WKWebView {
        return self.wkWebLoadRequest(url.strToRequest()!)
    }
    
    func wkWebLoadUrl(_ url: URL) -> WKWebView {
        return self.wkWebLoadRequest(URLRequest(url: url))
    }
    
    func wkWebJSContext() -> JSContext? {
        return self.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
    }
    
    func wkWebRunJs(_ js: String) {
        self.evaluateJavaScript(js, completionHandler: nil)
    }
    
    func wkWebRunJs(_ js: String, completionHandlerBlock: @escaping (_ any: Any?, _ err: Error?)->Void ) {
        self.evaluateJavaScript(js, completionHandler: completionHandlerBlock)
    }
    
    func wkWebRemoveAllCacheData(finishBlock: @escaping ()->Void) {
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date.init(timeIntervalSince1970: 0), completionHandler: finishBlock)
    }
    
}


public class JsMethodControl : NSObject, WKScriptMessageHandler {
    
    private var uController: WKUserContentController?
    var sd: JsMethodModel?
    
    private lazy var methods: NSMutableArray = {
        let m = NSMutableArray()
        return m
    }()
    
    init(_ uController: WKUserContentController) {
        self.uController = uController
    }
    
    func addJs(_ name: String, handler: JsMethodModel.JSBlock?) {
        let m = JsMethodModel.init(name, handler)
        self.methods.add(m)
        self.uController?.add(self, name: name)
    }
    
    func removeAllMethods() {
        for  m in self.methods {
            let model: JsMethodModel = m as! JsMethodModel
            self.uController?.removeScriptMessageHandler(forName: model.methodName!)
        }
        self.methods.removeAllObjects()
    }
    
    //代理方法
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let name: String? = message.name
        if name == nil || name?.count == 0 {
            return
        }
        
        for  m in self.methods {
            let model: JsMethodModel = m as! JsMethodModel
            if model.methodName == name {
                if model.methodBlock != nil {
                    model.methodBlock!(message.body)
                }
                return
            }
        }
    }
    
}

public class JsMethodModel {
    
    public typealias JSBlock = ((_ any: Any)->Void)
    var methodName: String?
    var methodBlock: JSBlock?
    
    init(_ name: String?, _ block: JSBlock?) {
        self.methodName = name
        self.methodBlock = block
    }
    
}

