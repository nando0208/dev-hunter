//
//  AppDelegate.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 27/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window?.rootViewController = SearchRouter.presentSearchModule()
        return true
    }
}
