//
//  MyTableViewCell.swift
//  ExpandableTableViewWidgetDemo
//
//  Created by Yiyin Shen on 16/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
}

extension MyTableViewCell: ExpandableTableCellProtocol{
    func configure(with model: ExpandableTableSectionItemModelProtocol) {
        if let model = model as? MySectionItemModel {
            label.text = model.itemTitle
        }
    }
}
