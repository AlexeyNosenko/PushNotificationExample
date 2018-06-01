//
//  AppDelegateExtensions.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import Foundation
import UserNotifications

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        guard let aps = userInfo["aps"] as? [String : Any] else {
            return
        }
        
        if response.actionIdentifier == PushActions.open.rawValue {
            var tableModel = TableModel.init(dictionary: aps)
            tableModel.info = "Added with action"
            delegate?.update(addedTableModel: tableModel)
        }
    }
}
