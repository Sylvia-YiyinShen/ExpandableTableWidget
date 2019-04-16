//
//  ViewController.swift
//  ExpandableTableViewWidgetDemo
//
//  Created by Yiyin Shen on 16/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widget: ExpandableTableWidget!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureExpandableTableView()
    }

    private func configureExpandableTableView() {
        widget.configure(with: sectionModels,
                         headerViewNib: UINib(nibName: "MyHeaderView", bundle: .main),
                         cellNib: UINib(nibName: "MyTableViewCell", bundle: .main),
                         rowAnimation: .none)
    }

    private var sectionModels: [MySectionModel] {
        let itemModel1 = MySectionItemModel(itemTitle: "cell 1")
        let itemModel2 = MySectionItemModel(itemTitle: "cell 2")
        let itemModel3 = MySectionItemModel(itemTitle: "cell 3")
        let items = [itemModel1, itemModel2, itemModel3]
        return  [
            MySectionModel(items: items, sectionTitle: "Section A", isExpanded: false),
            MySectionModel(items: items, sectionTitle: "Section B", isExpanded: false),
            MySectionModel(items: items, sectionTitle: "Section C", isExpanded: true)]
    }
}

