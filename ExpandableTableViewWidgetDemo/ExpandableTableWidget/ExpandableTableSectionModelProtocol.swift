//
//  ExpandaleTableSectionModelProtocol.swift
//  ExpandableTableViewWidgetDemo
//
//  Created by Yiyin Shen on 16/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation

public protocol ExpandableTableSectionModelProtocol {
    var items: [ExpandableTableSectionItemModelProtocol] { get }
    var isExpanded: Bool { get set }
}
