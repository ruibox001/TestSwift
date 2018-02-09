//
//  AppDelegate.swift
//  TestSwift
//
//  Created by wsy on 2018/1/8.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import UIKit
import ESTabBarController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        self.window = UIWindow()
        self.window?.backgroundColor = UIColor.white
        self.window?.frame = UIScreen.main.bounds
        self.window?.makeKeyAndVisible()
        
        let tabBarController = ESTabBarController()
        let v1 = BaseNavigationController.init(rootViewController: FirstViewController())
        let v2 = BaseNavigationController.init(rootViewController: SecondViewController())
        let v3 = BaseNavigationController.init(rootViewController: ThirdViewController())
        v1.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "查找", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "相册", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))

        v1.tabBarItem.badgeValue = "New"
        v2.tabBarItem.badgeValue = "99+"
        v3.tabBarItem.badgeValue = "1"
        if let tabBarItem = v3.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeColor = UIColor.blue
        }
        
        tabBarController.viewControllers = [v1, v2, v3]
        self.window?.rootViewController = tabBarController;
        
        return true
    }

    func applicationWillResignActive(_ applicatio: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        Dlog("enterbg 1")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

