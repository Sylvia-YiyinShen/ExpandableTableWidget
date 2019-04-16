//
//  ExpandableTableHeaderViewProtocol.swift
//  ExpandableTableViewWidgetDemo
//
//  Created by Yiyin Shen on 16/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

protocol ExpandableTableHeaderViewProtocol {
    func configure(with sectionModel: ExpandableTableSectionModelProtocol)
    var tapArea: UIView { get }
}
