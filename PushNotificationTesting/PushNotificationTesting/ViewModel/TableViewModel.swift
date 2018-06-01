//
//  RowsTableController.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import Foundation

struct TableViewModel {
    private var rowsTable = [TableModel]()
    
    var count: Int {
        return rowsTable.count
    }
    
    mutating func add(row: TableModel) {
        rowsTable.append(row)
    }
    
    mutating func remove(atIndex index: Int) {
        rowsTable.remove(at: index)
    }
    
    func tableViewModelCell(atIndex index: Int) -> TableViewModelCell {
        return TableViewModelCell.init(tableModel: rowsTable[index])
    }
}
