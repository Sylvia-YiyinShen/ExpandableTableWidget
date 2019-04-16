//
//  ExpandableTableWidget.swift
//  ExpandableTableViewWidgetDemo
//
//  Created by Yiyin Shen on 16/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

public class ExpandableTableWidget: UIView {
    private var tableView = UITableView()
    private var sectionModels: [ExpandableTableSectionModelProtocol] = []
    private var rowAnimation: UITableView.RowAnimation = .none

    private func configureTableView(headerViewNib: UINib, cellNib: UINib){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 88.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(headerViewNib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(cellNib, forCellReuseIdentifier: "Cell")
        addSubview(tableView)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = bounds
    }

    public func configure(with sectionModels: [ExpandableTableSectionModelProtocol], headerViewNib: UINib, cellNib: UINib, rowAnimation: UITableView.RowAnimation? = .none) {
        self.sectionModels = sectionModels
        self.rowAnimation = rowAnimation ?? .none
        configureTableView(headerViewNib: headerViewNib, cellNib: cellNib)
    }
}

extension ExpandableTableWidget: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionModels.count
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")
        if let header = headerView as? ExpandableTableHeaderViewProtocol {
            let sectionModel = sectionModels[section]
            header.configure(with: sectionModel)
             let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnHeader(recognizer:)))
            header.tapArea.addGestureRecognizer(tapGesture)
            header.tapArea.tag = section
        }
        return headerView
    }

    @objc private func didTapOnHeader(recognizer: UITapGestureRecognizer) {
        if let section = recognizer.view?.tag {
            sectionModels[section].isExpanded = !sectionModels[section].isExpanded
            tableView.reloadSections(IndexSet(integer: section), with: rowAnimation)
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sectionModels[section].isExpanded {
            return sectionModels[section].items.count
        } else {
            return 0
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemModel = sectionModels[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let itemCell = cell as? ExpandableTableCellProtocol {
            itemCell.configure(with: itemModel)
        }
        return cell
    }
}
