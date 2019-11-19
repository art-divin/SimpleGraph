//
//  AppDelegate.swift
//  solution_2_ralikhamov
//
//  Created by Ruslan Alikhamov on 19/11/2019.
//  Copyright © 2019 Ruslan Alikhamov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    var combiner : Combiner?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupCombiner()
        return true
    }
    
}

extension AppDelegate {
    
    private func setupCombiner() {
        self.combiner = Combiner()
        self.combiner?.combine()
    }

}

