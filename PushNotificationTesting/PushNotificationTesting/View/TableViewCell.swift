//
//  TableViewCell.swift
//  PushNotificationTesting
//
//  Created by Алексей on 31.05.2018.
//  Copyright © 2018 Алексей. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var tableViewModelCell: TableViewModelCell! {
        didSet{
            titleLabel.text = tableViewModelCell.title
            infoLabel.text = tableViewModelCell.info
            dateLabel.text = tableViewModelCell.date.description
        }
    }

}
