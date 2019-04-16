//
//  MySectionModel.swift
//  ExpandableTableViewWidgetDemo
//
//  Created by Yiyin Shen on 16/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation

class MySectionModel: ExpandableTableSectionModelProtocol {
    var isExpanded: Bool
    var items: [ExpandableTableSectionItemModelProtocol]

    var sectionTitle: String

    init(items: [MySectionItemModel], sectionTitle: String, isExpanded: Bool) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.isExpanded = isExpanded
    }
}
