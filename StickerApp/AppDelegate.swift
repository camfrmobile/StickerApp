//
//  AppDelegate.swift
//  StickerApp
//
//  Created by Trần Văn Cam on 05/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //let introVC = IntroViewController()
        let homeVC = HomeViewController()
        
        window?.rootViewController = homeVC
        window?.makeKeyAndVisible()
        return true
    }

}

