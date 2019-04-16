//
//  MyHeaderView.swift
//  ExpandableTableViewWidgetDemo
//
//  Created by Yiyin Shen on 16/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class MyHeaderView: UITableViewHeaderFooterView, ExpandableTableHeaderViewProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var indicatorLabel: UILabel!

    var tapArea: UIView {
        return indicatorLabel
    }

    func configure(with sectionModel: ExpandableTableSectionModelProtocol) {
        if let sectionModel = sectionModel as? MySectionModel {
            titleLabel.text = sectionModel.sectionTitle
            if sectionModel.isExpanded {
                indicatorLabel.text = "Close"
            } else {
                indicatorLabel.text = "Open"
            }
        }
        indicatorLabel.isUserInteractionEnabled = true
    }
}
