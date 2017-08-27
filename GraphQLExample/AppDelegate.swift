//
//  AppDelegate.swift
//  GraphQLExample
//
//  Created by Thanh-Dung Nguyen on 8/20/17.
//  Copyright © 2017 Thanh-Dung Nguyen. All rights reserved.
//

import UIKit
import Apollo
import IQKeyboardManagerSwift

let graphQLEndpoint = "https://api.graph.cool/simple/v1/xxx"
let apollo = ApolloClient(url: URL(string: graphQLEndpoint)!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.sharedManager().enable = true

        return true
    }
}

