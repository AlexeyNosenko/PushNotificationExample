//
//  TableModel.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import Foundation

struct TableModel {
    var title: String
    var info: String
    var category: String
    var date: Date
    
    init(title: String, info: String, date: Date, category: String) {
        self.title = title
        self.info = info
        self.date = date
        self.category = category
    }
    
    init(dictionary: [String : Any]) {
        title = ""
        info = ""
        category = ""
        
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        
        if let info = dictionary["info"] as? String {
            self.info = info
        }
        
        if let category = dictionary["category"] as? String {
            self.category = category
        }
        
        date = Date()
    }
}
