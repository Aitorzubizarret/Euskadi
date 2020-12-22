//
//  AppDelegate.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta on 27/08/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ///
        /// Coordinator Pattern for iOS 12 and lower versions.
        ///
        
        // Creates and initializes the Navigation Controller and the TabBar Controller.
        let tabBarController: UITabBarController = UITabBarController()
        let navigationController: UINavigationController = UINavigationController()
        
        // Creates the Main Coordinator with the Navigation Controller and the TabBar Controller, and starts it.
        coordinator = MainCoordinator(tabBarController: tabBarController, navigationController: navigationController)
        coordinator?.start()
        
        // Creates the window and adds the TabBar controller as the root view.
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window!.rootViewController = tabBarController
        window!.makeKeyAndVisible()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        SettingsBundleHelper().setAppVersion()
        SettingsBundleHelper().setBuildVersion()
    }

    // MARK: UISceneSession Lifecycle
    
    @available (iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available (iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

