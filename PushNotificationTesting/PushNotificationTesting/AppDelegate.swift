//
//  AppDelegate.swift
//  PushNotificationTesting
//
//  Created by Алексей on 29.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var delegate: UpdateTableView?
    
    let pushNotificationController = PushNotificationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        pushNotificationController.registration()
        pushNotificationController.setDelegate(delegate: self)
        if let navigationC = window?.rootViewController as? UINavigationController,
            let tableView = navigationC.topViewController as? TableView {
            delegate = tableView
        }
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        pushNotificationController.showToken(ofDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        guard let aps = userInfo["aps"] as? [String : Any] else {
            return
        }
        if aps["content-available"] as? Int == 1 {
            print("Silent update data")
            //completionHandler(.newData or .noData)
        } else {
            let tableModel = pushNotificationController.parse(userInfo: aps)
            delegate?.update(addedTableModel: tableModel)
            completionHandler(.newData)
        }
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Error register notification ", error)
    }
}

