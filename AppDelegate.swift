//
//  AppDelegate.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        navController.setNavigationBarHidden(true, animated: false)
        coordinator = AppCoordinator(navigationController: navController, window: window!)
        coordinator?.startSpalshView()
        
        return true
    }
    //애플리케이션이 InActive 상태로 전환되기 직전에 호출
    func applicationWillResignActive(_ application: UIApplication){
        
    }
    
    //애플리케이션이 백그라운드 상태로 전환된 직후 호출
    func applicationDidEnterBackground(_ application: UIApplication){
        
    }
    
    //애플리케이션이 Active 상태가 되기 직전, 화면에 보여지기 직전에 호출
    func applicationWillEnterForeground(_ application: UIApplication){
        
    }
    
    //애플리케이션이 Active 상태로 전환된 직후 호출
    func applicationDidBecomeActive(_ application: UIApplication){
        
    }
    
    //애플리케이션이 종료되기 직전에 호출
    func applicationWillTerminate(_ application: UIApplication){
        
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        AppInfoStorage.shared.fcmToken = fcmToken
    }
}

