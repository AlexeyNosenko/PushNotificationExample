//
//  RowsTable.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import Foundation

struct TableViewModelCell {
    var title: String
    var info: String
    var date: Date
    
    init(tableModel: TableModel) {
        title = tableModel.title
        info = tableModel.info
        date = tableModel.date
    }
    
    init(dictionary: [AnyHashable : Any]) {
        title = dictionary["title"] as! String
        info = dictionary["info"] as! String
        date = Date()
    }
}
