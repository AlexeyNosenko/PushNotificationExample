//
//  PushNotificationController.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import UIKit
import UserNotifications

class PushNotificationController {
    func setDelegate(delegate: UNUserNotificationCenterDelegate) {
        UNUserNotificationCenter.current().delegate = delegate
    }
    
    private func addActions() {
        let action = UNNotificationAction.init(identifier: PushActions.open.rawValue,
                                               title: "Action",
                                               options: [.foreground])
        
        // передать category  в push уведомлении с таким названием и будет кнопочка)
        let category = UNNotificationCategory(identifier: PushCategory.news.rawValue,
                                              actions: [action],
                                              intentIdentifiers: [],
                                              options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
    func registration() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Granted ", granted)
        
            guard granted else {
                return
            }
            self.addActions()
            self.setNotificationSetting()
        }
    }
    
    //device token: fd9dfa76630148d62dc579c6cd932ccd40884f901cc2815f346fa789280b33c4
    private func setNotificationSetting() {
        UNUserNotificationCenter.current().getNotificationSettings { (setting) in
            guard setting.authorizationStatus == .authorized else {
                return
            }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func showToken(ofDeviceToken deviceToken: Data) {
        let tokenPart = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenPart.joined()
        print("Device token", token)
    }

    func parse(userInfo: [String : Any]) -> TableModel {
        return TableModel.init(dictionary: userInfo)
    }
}
