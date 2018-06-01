//
//  TableViewExtensions.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import Foundation

extension TableView: UpdateTableView {
    func update() {
        self.tableView.reloadData()
    }
    
    func update(addedTableModel tableModel: TableModel) {
        self.tableController.add(row: tableModel)
        update()
    }
}
