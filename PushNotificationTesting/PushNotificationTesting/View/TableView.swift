//
//  TableViewController.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import UIKit

protocol UpdateTableView {
    func update()
    func update(addedTableModel: TableModel)
}

class TableView: UITableViewController {
    
    var tableController: TableViewModel! {
        didSet{
            update()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableController = TableViewModel()
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableController.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.tableViewModelCell = self.tableController.tableViewModelCell(atIndex: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
}
